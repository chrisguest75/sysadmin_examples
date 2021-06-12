# README
Demonstrates how to configure and use ssh 

## Install

```sh
# debian
apt install openssh-client
apt install openssh-server
```

## Config 
```sh
# client config 
cat /etc/ssh/ssh_config           

# daemon config
cat /etc/ssh/sshd_config           

# known hosts file
cat ~/.ssh/known_hosts 

# list of authorised keys for the machine 
cat ~/.ssh/authorized_keys
```

## Generate keys 
```sh
# generate an ecc key
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519  
```

## Agent
```sh
# add default key
ssh-add

# list loaded keys
ssh-add -l

ssh-agent
```


## Distribute public keys to VMs
```sh
ssh-copy-id
```

Copying local key to a vagrant box
```sh
export VAGRANT_MACHINE=$(pwd)/.vagrant   
echo $VAGRANT_MACHINE        

# 
VBoxManage guestproperty enumerate $(cat $VAGRANT_MACHINE/machines/default/virtualbox/id) 

ssh -i ./.vagrant/machines/default/virtualbox/private_key -l vagrant -o StrictHostKeyChecking=no -p 22 192.168.1.224 'mkdir -m 700 ~/.ssh; echo ' $(< ~/.ssh/id_ed25519.pub) ' >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys' 

# list authorised keys
ssh -i ./.vagrant/machines/default/virtualbox/private_key -l vagrant -o StrictHostKeyChecking=no -p 22 192.168.1.224 'cat ~/.ssh/authorized_keys'

# agent forwarding (need to run ssh-agent in the session as well)
ssh -A vagrant@192.168.1.224   
```



## Resources


