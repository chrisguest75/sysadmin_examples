# SSH CERTIFICATES

Demonstrate how to use a SSH certificates rather than keys.  

## Table of Contents

- [SSH CERTIFICATES](#ssh-certificates)
  - [Table of Contents](#table-of-contents)
  - [Reason](#reason)
    - [Run example](#run-example)
    - [Configure Certificate Authority](#configure-certificate-authority)
    - [🧼 Cleanup](#-cleanup)
    - [Debugging and troubleshooting](#debugging-and-troubleshooting)
  - [Resources](#resources)

## Reason

Keys never expire. Neither users nor hosts are forced to refresh their keys.  

TODO:

* Get the CA to issue the certificate
* Work out how to more easily split these 08_ssh changes into a seperate MR.

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
docker compose logs caserver        
```

### Configure Certificate Authority

```sh
docker compose exec -it caserver /bin/bash




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

## Resources

* 3 Reasons to use SSH Certificates instead of SSH Keys – SecAdvent Day 22 [here](https://www.devseccon.com/blog/3-reasons-to-use-ssh-certificates-instead-of-ssh-keys-secadvent-day-22)
* SSH certificates [here](https://berndbausch.medium.com/ssh-certificates-a45bdcdfac39)
* If you’re not using SSH certificates you’re doing SSH wrong [here](https://smallstep.com/blog/use-ssh-certificates/)
* What is the best way to manage SSH identities and access on scale? [here](https://www.reddit.com/r/devops/comments/s1zzz1/what_is_the_best_way_to_manage_ssh_identities_and/)
* Facebook: Scalable and secure access with SSH [here](https://engineering.fb.com/2016/09/12/security/scalable-and-secure-access-with-ssh/)
* chrisguest75/docker_examples/40_ssl_nginx/README.md [here](https://github.com/chrisguest75/docker_examples/blob/master/40_ssl_nginx/README.md)


https://goteleport.com/blog/ssh-certificates/
https://docs.github.com/en/enterprise-cloud@latest/organizations/managing-git-access-to-your-organizations-repositories/about-ssh-certificate-authorities
https://keybase-ssh-ca-bot.readthedocs.io/en/latest/getting_started.html
https://www.sweharris.org/post/2022-02-06-ssh-certs-again/
https://github.com/Netflix/bless
https://github.com/stoggi/sshrimp
