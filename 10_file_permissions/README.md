# README

Demonstrates some examples of using permissions  

Follow  [03_usermanagement/README.md](../03_usermanagement/README.md)  

TODO:

* gid
* owners

## Commands 

| Commmand              | Description |
| -                     | - |
| umask                 | Default file permissions mask for new files       |
| chmod                 | change file modes or Access Control Lists  |
| chown                 | change file owner and group   |
| chgrp                 | change group   |
| ls                    |   list directory contents |
| stat                  | stat -- display file status   |

## Setup users and groups

```sh
sudo adduser testuser 
sudo groupadd mygroup

su -l testuser  
sudo usermod -aG mygroup $USER
```

## Examine permissions

### Block device

```sh
# show block device B with user RW and group RW.
ls -l /dev/sda

> brw-rw---- 1 root    disk      8,   0 Jun 12 13:33 sda

# UID 'root' and GID 'disk'
stat /dev/sda
```

### Character device

```sh
# show character device C with user RW, group RW and other RW.
ls -l /dev/tty

> crw-rw-rw- 1 root tty 5, 0 Jul  9 15:12 /dev/tty

# UID 'root' and GID 'tty'
stat /dev/tty
```

### Link

```sh
# show soft link L with user RW, group RW and other RW.
ls -l /dev/stdin

> lrwxrwxrwx 1 root    root          15 Jun 12 13:33 stdin -> /proc/self/fd/0

# UID 'root' and GID 'root'
stat /dev/stdin
```

## Set groups of permissions

```sh
# show permissions on files and directories 
find . -type f -exec ls -ld {} \;
find . -type d -exec ls -ld {} \;
```

```sh
find . -type d -exec chmod 0755 {} \; 
find . -type f -exec chmod 0644 {} \; 
```

## Resources

* Really good breakdown of meaning of permissions [here](https://mason.gmu.edu/~montecin/UNIXpermiss.htm)  
* Permission calculator [here](http://permissions-calculator.org/)  
