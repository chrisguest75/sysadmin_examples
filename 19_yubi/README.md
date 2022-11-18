# README

Demonstrate how to use `yubikey`.

TODO:

* Create an SSH server in docker and use ssh key on yubikey
* Creat

* titan keys?
https://support.google.com/titansecuritykey/answer/9148044?hl=en-GB
* https://github.com/ixydo/gpg-smartcard-automation

## SSH

Ref: [08_SSH/README.md](../08_SSH/README.md)  
Ref: [39_ssh/README.md](https://github.com/chrisguest75/docker_examples/tree/master/39_ssh/README.md)  

### Run example

The `nginx` container is not available on the network. We use the `ssh` server to allow access.  

```sh
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
# curl against the nginx container
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

# open connections (only rsa seems to work)
ssh -vvvv -o StrictHostKeyChecking=no -i ./ssh_server/keys/id_ed25519 -p 2822 root@0.0.0.0
ssh -vvvv -o StrictHostKeyChecking=no -i ./ssh_server/keys/id_rsa -p 2822 root@0.0.0.0
```

## Prereqs

```sh
sudo apt install -y curl gnupg2 gnupg-agent cryptsetup scdaemon pcscd
```

```sh
lsusb -v 2> /dev/null | grep -A4 -B 5 -i yubi  
```

## Resources

* https://developers.yubico.com/
* https://fidoalliance.org/fido2/
