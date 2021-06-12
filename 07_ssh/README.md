# README
Demonstrates how to configure and use ssh 

TODO: 
* Decoding the private and public keys
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

cat ~/.ssh/id_ed25519 
cat ~/.ssh/id_ed25519.pub 

# key details
ssh-keygen -l -f ~/.ssh/id_ed25519   

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
# copy using tool
ssh-copy-id -i ~/.ssh/id_ed25519.pub user@ip
```

Copying local key to a vagrant box
```sh
# Get the vagrant folder
export VAGRANT_MACHINE=$(pwd)/.vagrant   
echo export VAGRANT_MACHINE=$VAGRANT_MACHINE        

# Get the machine id of the vagrant machine
export VAGRANT_MACHINE_ID=$(cat $VAGRANT_MACHINE/machines/default/virtualbox/id)
echo export VAGRANT_MACHINE_ID=$VAGRANT_MACHINE_ID 

# Extract the ip address of the vagrant machine
export VAGRANT_MACHINE_IP=$(VBoxManage guestproperty enumerate $VAGRANT_MACHINE_ID | grep '\/1\/V4\/IP' | cut -f2 -d"," | cut -f2 -d ":" | awk '{print $1}')
echo export VAGRANT_MACHINE_IP=$VAGRANT_MACHINE_IP        

# list authorised keys
ssh -i $VAGRANT_MACHINE/machines/default/virtualbox/private_key -l vagrant -o StrictHostKeyChecking=no -p 22 $VAGRANT_MACHINE_IP 'cat ~/.ssh/authorized_keys'

# Get local ssh key and add .pub to authorised keys
export LOCAL_PUBLIC_KEY=~/.ssh/id_ed25519.pub
ssh -i $VAGRANT_MACHINE/machines/default/virtualbox/private_key -l vagrant -o StrictHostKeyChecking=no -p 22 $VAGRANT_MACHINE_IP 'mkdir -m 700 ~/.ssh; echo ' $(< $LOCAL_PUBLIC_KEY) ' >> ~/.ssh/authorized_keys ; chmod 600 ~/.ssh/authorized_keys' 

# agent forwarding (need to run ssh-agent in the session as well)
ssh -A vagrant@$VAGRANT_MACHINE_IP
```

## Resources


