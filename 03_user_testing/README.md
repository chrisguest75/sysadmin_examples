# README
Demonstrates how to perform user management 

## useradd and adduser  
```sh
sudo apt install adduser  

sudo adduser testuser 
```

## groupadd

```sh
groupadd mygroup
```

## Helpful commands
```sh
# lists logged in users 
users  

# list users  
cat /etc/passwd 

# list groups user is in.  
groups 

# list groups user is in with id
id 

# list all of the groups.   
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
# add a user to the group
sudo usermod -aG mygroup your-user

# create and share folder
sudo mkdir /shares 
sudo chgrp -R mygroup /shares 
sudo chmod 2775 /shares  
```


## Resources




