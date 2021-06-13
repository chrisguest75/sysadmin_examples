# README
Demonstrates some examples of using permissions 

Follow  [03_usermanagement/README.md](../03_usermanagement/README.md). 

## Setup users and groups 
```sh
sudo adduser testuser 
sudo groupadd mygroup

su -l testuser  
sudo usermod -aG mygroup $USER
```


drwxr-xr-x
lrwxrwxrwx 1 root    root          15 Jun 12 13:33 stdin -> /proc/self/fd/0
crw-rw-rw- 1 root    tty       5,   0 Jun 12 15:39 tty
brw-rw---- 1 root    disk      8,   0 Jun 12 13:33 sda


stat /dev/sda
stat /dev/tty
stat /dev/stdin




find . -type d -exec chmod 0755 {} \; 
find . -type f -exec chmod 0644 {} \; 


## Resources


https://mason.gmu.edu/~montecin/UNIXpermiss.htm
http://permissions-calculator.org/

