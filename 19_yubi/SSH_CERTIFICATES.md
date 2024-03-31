# SSH CERTIFICATES

NOTES:

* We first generate a Certificate Authority
* "OpenSC is no longer required, since we now have a functional PKCS #11 module, namely ykcs11." [here](https://developers.yubico.com/PIV/Guides/SSH_with_PIV_and_PKCS11.html)

## Generate Certificates

```sh
mkdir -p ./ssh_server/keys

# -N means no passphrase
ssh-keygen -N '' -C user-ca -f ./ssh_server/keys/ca
sed 's/^/cert-authority /' ./ssh_server/keys/ca.pub > ./ssh_server/keys/authorized_keys

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

Start the SSH server.  

```sh
docker compose up -d --build --force-recreate
```


```sh
export PATH=$(brew --prefix openssh)/bin:$PATH
ssh-keygen -D $(realpath /usr/local/lib/libykcs11.dylib) -e

ssh -vvvv -o StrictHostKeyChecking=no -I $(realpath /usr/local/lib/libykcs11.dylib) -p 2823 root@0.0.0.0

# THIS DOES NOT WORK
ssh-add -s $(realpath /usr/local/lib/libykcs11.dylib) 
ssh-add -L 
```

### 🧼 Cleanup

```sh
# bring it down and delete the volume
docker compose down 
```

### Debugging and troubleshooting

```sh
docker compose exec -it sshserver /bin/bash

# start ssh
rsyslogd
service ssh start
nano /etc/ssh/sshd_config  
service ssh restart

passwd
cat /root/.ssh/authorized_keys
cat /var/log/auth.log

#PasswordAuthentication yes
#PermitEmptyPasswords yes
#PermitRootLogin without-password
```

## Resources

* https://developers.yubico.com/PIV/Guides/SSH_user_certificates.html
* https://ultrabug.fr/en/Tech%20Blog/2017/2017-05-12-hardening-ssh-authentication-using-yubikey-22/
