# SSH CERTIFICATES

The `nginx` container is not available on the network. We use the `ssh` server to allow access.  

PIV - Personal Identity Verification - [What is PIV?](https://developers.yubico.com/PIV/)

Ref: [08_SSH/README.md](../08_SSH/README.md)  
Ref: [chrisguest75/docker_examples/39_ssh/README.md](https://github.com/chrisguest75/docker_examples/tree/master/39_ssh/README.md)  

NOTES:

* We first generate a Certificate Authority
* "OpenSC is no longer required, since we now have a functional PKCS #11 module, namely ykcs11." [here](https://developers.yubico.com/PIV/Guides/SSH_with_PIV_and_PKCS11.html)

## Non-Apple SSL

```sh
export PATH=$(brew --prefix openssh)/bin:$PATH  
```

## Generate keys (non-yubi)

```sh
# OpenSSH_8.6p1, LibreSSL 3.3.6
ssh -V 

# create keys
mkdir -p ./ssh_server/keys
ssh-keygen -o -a 100 -t ed25519 -f ./ssh_server/keys/id_ed25519 
ssh-keygen -o -a 100 -t rsa -f ./ssh_server/keys/id_rsa 

cat ./ssh_server/keys/id_ed25519.pub > ./ssh_server/keys/nonyubi_authorized_keys
cat ./ssh_server/keys/id_rsa.pub >> ./ssh_server/keys/nonyubi_authorized_keys


ssh -vvvv -o StrictHostKeyChecking=no -i ./ssh_server/keys/id_ed25519 -p 2822 root@0.0.0.0
ssh -vvvv -o StrictHostKeyChecking=no -i ./ssh_server/keys/id_rsa -p 2822 root@0.0.0.0
```

## Generate certificates

NOTE: An occupied slot on the Yubikey PIV interface usually contains a private key, a public key and an X509 certificate. The key pair generate, the certificate generation and the certificate import are done using different actions in the right order. REF: [Key Generation](https://developers.yubico.com/yubico-piv-tool/Actions/key_generation.html)

Slots [here](https://developers.yubico.com/PIV/Introduction/Certificate_slots.html)  

```sh
ykman piv --help

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

# once in ssh shell curl against the nginx container
curl 172.16.238.64:80

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

* Using SSH User Certificates with PIV keys [here](https://developers.yubico.com/PIV/Guides/SSH_user_certificates.html)
* Method 2 - SSH using Yubikey and PIV [here](https://ultrabug.fr/en/Tech%20Blog/2017/2017-05-12-hardening-ssh-authentication-using-yubikey-22/)
* https://developers.yubico.com/PIV/Guides/SSH_user_certificates.html
* Getting Started: SSH Authentication with a YubiKey as a Smart Card [here](https://developers.yubico.com/PIV/Guides/PIV_Walk-Through.html)
* Getting PIV-based SSH working on a YubiKey [here](https://eta.st/2021/03/06/yubikey-5-piv.html)
* yubikey-agent is a seamless ssh-agent for YubiKeys [here](https://github.com/FiloSottile/yubikey-agent)
* Using your Yubikey to store your SSH Key (RSA 4096) [here](https://dev.to/paulmicheli/using-your-yubikey-to-store-your-ssh-key-rsa-4096-3pfl)
* OpenSC [repo](https://github.com/OpenSC/OpenSC/wiki)
* Yubikey PIV Certificate Slot Configuration [here](https://www.securew2.com/blog/yubikey-piv-certificate-slot-configuration)
* Yubico PIV Tool [here](https://developers.yubico.com/yubico-piv-tool/)
* If you’re not using SSH certificates you’re doing SSH wrong [here](https://smallstep.com/blog/use-ssh-certificates/)