# PIV

PIV - Personal Identity Verification - [What is PIV?](https://developers.yubico.com/PIV/)

## Generate keys

NOTE: An occupied slot on the Yubikey PIV interface usually contains a private key, a public key and an X509 certificate. The key pair generate, the certificate generation and the certificate import are done using different actions in the right order. REF: [Key Generation](https://developers.yubico.com/yubico-piv-tool/Actions/key_generation.html)

Slots [here](https://developers.yubico.com/PIV/Introduction/Certificate_slots.html)  

```sh
ykman piv --help

# requires managmment key (not pin)
yubico-piv-tool -s 9a -a generate -k --pin-policy=once --touch-policy=always --algorithm=RSA2048 -o ./ssh_server/keys/public.pem

yubico-piv-tool -a verify-pin -a selfsign-certificate -s 9a -S "/CN=SSH key/" -i ./ssh_server/keys/public.pem -o ./ssh_server/keys/cert.pem

# not working
yubico-piv-tool -s 9a -a import-key -i ./ssh_server/keys/id_ed25519 
```

## SSH

Ref: [08_SSH/README.md](../08_SSH/README.md)  
Ref: [chrisguest75/docker_examples/39_ssh/README.md](https://github.com/chrisguest75/docker_examples/tree/master/39_ssh/README.md)  

### Run example

The `nginx` container is not available on the network. We use the `ssh` server to allow access.  

```sh
# OpenSSH_8.6p1, LibreSSL 3.3.6
ssh -V 

# create keys
mkdir -p ./ssh_server/keys
ssh-keygen -o -a 100 -t ed25519 -f ./ssh_server/keys/id_ed25519 
ssh-keygen -o -a 100 -t rsa -f ./ssh_server/keys/id_rsa 
```

Start the containers.

```sh
# start server
docker compose up -d --build --force-recreate

# quick test
docker compose logs internalnginx
docker compose logs sshserver
```

SSH to get access to `nginx`.  

```sh
# ssh onto server 
ssh -vvvv -o StrictHostKeyChecking=no -i ./ssh_server/keys/id_rsa -p 2822 root@0.0.0.0
# once in ssh shell curl against the nginx container
curl 172.16.238.64:80
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

# open connections 
# Both work now - there was a time that only rsa seemed to work. 
ssh -vvvv -o StrictHostKeyChecking=no -i ./ssh_server/keys/id_ed25519 -p 2822 root@0.0.0.0
ssh -vvvv -o StrictHostKeyChecking=no -i ./ssh_server/keys/id_rsa -p 2822 root@0.0.0.0
```

## Resources

* https://developers.yubico.com/PIV/Guides/SSH_user_certificates.html
* Getting Started: SSH Authentication with a YubiKey as a Smart Card [here](https://developers.yubico.com/PIV/Guides/PIV_Walk-Through.html)
* Getting PIV-based SSH working on a YubiKey [here](https://eta.st/2021/03/06/yubikey-5-piv.html)
* yubikey-agent is a seamless ssh-agent for YubiKeys [here](https://github.com/FiloSottile/yubikey-agent)
* Using your Yubikey to store your SSH Key (RSA 4096) [here](https://dev.to/paulmicheli/using-your-yubikey-to-store-your-ssh-key-rsa-4096-3pfl)
* OpenSC [repo](https://github.com/OpenSC/OpenSC/wiki)
* Yubikey PIV Certificate Slot Configuration [here](https://www.securew2.com/blog/yubikey-piv-certificate-slot-configuration)
* Yubico PIV Tool [here](https://developers.yubico.com/yubico-piv-tool/)
* If you’re not using SSH certificates you’re doing SSH wrong [here](https://smallstep.com/blog/use-ssh-certificates/)
