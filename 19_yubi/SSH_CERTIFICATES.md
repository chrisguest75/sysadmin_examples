# SSH CERTIFICATES

NOTES:

* We first generate a Certificate Authority
* "OpenSC is no longer required, since we now have a functional PKCS #11 module, namely ykcs11." [here](https://developers.yubico.com/PIV/Guides/SSH_with_PIV_and_PKCS11.html)

## Generate Certificates

```sh
mkdir -p ./ssh_server/ca-keys
mkdir -p ./ssh_server/keys

# -N means no passphrase
# -C means comment
ssh-keygen -N '' -C user-ca -f ./ssh_server/ca-keys/ca
sed 's/^/cert-authority /' ./ssh_server/ca-keys/ca.pub > ./ssh_server/ca-keys/authorized_keys

# generate a key
yubico-piv-tool -a generate -s 9c -A RSA2048 --pin-policy=never --touch-policy=always -o ./ssh_server/keys/public.pem

# when doing this you have to touch the key
yubico-piv-tool -a selfsign-certificate -s 9c -S "/CN=SSH key/" -i ./ssh_server/keys/public.pem -o ./ssh_server/keys/cert.pem

yubico-piv-tool -a import-certificate -s 9c -i ./ssh_server/keys/cert.pem

#https://github.com/OpenSC/OpenSC/wiki/macOS-Quick-Start
opensc-tool --name
# the key needs pressing on 2nd PIN entry
pkcs11-tool --login --test
```

## Test

YubiKey thumbprint  

```sh
export PATH=$(brew --prefix openssh)/bin:$PATH

# copy thumbprint
ssh-keygen -D $(realpath /usr/local/lib/libykcs11.dylib) -e | grep Signature > ./ssh_server/keys/yubi_authorized_keys
```

Start the SSH server.  

```sh
docker compose -f ./docker-compose.ca.yubi.ssh.yaml up -d --build --force-recreate
```

Login with YubiKey  

```sh
ssh -vvvv -o StrictHostKeyChecking=no -I $(realpath /usr/local/lib/libykcs11.dylib) -p 2822 root@0.0.0.0

# THIS DOES NOT WORK
ssh-add -s $(realpath /usr/local/lib/libykcs11.dylib) 
ssh-add -L 
```



### 🧼 Cleanup

```sh
# bring it down and delete the volume
docker compose -f ./docker-compose.ca.yubi.ssh.yaml down 
```

### Debugging and troubleshooting

```sh
docker compose -f ./docker-compose.ca.yubi.ssh.yaml exec -it sshserver /bin/bash

# start ssh
rsyslogd
service ssh start
nano /etc/ssh/sshd_config  
service ssh restart

passwd
cat /root/.ssh/authorized_keys
cat /var/log/auth.log

nano /root/.ssh/authorized_keys
#PasswordAuthentication yes
#PermitEmptyPasswords yes
#PermitRootLogin without-password
```

## Resources

* https://developers.yubico.com/PIV/Guides/SSH_user_certificates.html
* https://ultrabug.fr/en/Tech%20Blog/2017/2017-05-12-hardening-ssh-authentication-using-yubikey-22/
