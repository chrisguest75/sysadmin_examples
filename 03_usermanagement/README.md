# README

Demonstrates how to perform user management  

## useradd and adduser  

```sh
# install adduser cmd
sudo apt install adduser  

# add a testuser
sudo adduser testuser 
```

## groupadd

```sh
# add a group
groupadd mygroup
```

## Helpful commands

```sh
# lists logged in users 
users  

# list users  
getent passwd
cat /etc/passwd 

# list groups user is in.  
groups 

# list groups user is in with id
id 

# list all of the groups. Format "group_name:password:GID:user_list"
getent group
cat /etc/group  
```

## Switching users

```sh
# switch user
su -l testuser1   

# login as root 
sudo -I  
```

## Altering permissions  

```sh
cat /etc/sudoers 

# edit the sudoers file 
Visudo  

# Permission to install software In sudoers 
># User privilege specification 
>root    ALL=(ALL:ALL) ALL 
>testuser1 ALL=/usr/bin/apt-get 
```

## Share folders between users

```sh
# add a user to the group generated above
sudo usermod -aG mygroup $USER

# create and share folder
sudo mkdir /shares 
sudo chgrp -R mygroup /shares 
sudo chmod 2775 /shares  
```

## Resources

* cheatsheet adduser