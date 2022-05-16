# README

Demonstrate how to work with cgroups

## cgroups

```sh
# man pages
man cgroups
# list filesystems and look at cgroups
cat /proc/filesystems  
# see where they a virtually mounted
mount
```

## Install tooling

```sh
# install tooling
sudo apt install cgroup-tools        
# list cgroup tools
dpkg -L cgroup-tools | grep bin        
```

## Walk the filesystem

```sh
# cgroups v1
ls /sys/fs/cgroup/
# cgroups v2
ls /sys/fs/cgroup/unified     
```


## Resources

https://medium.com/nttlabs/cgroup-v2-596d035be4d7


https://opensource.com/article/20/10/cgroups

https://www.linuxjournal.com/content/everything-you-need-know-about-linux-containers-part-i-linux-control-groups-and-process

https://www.linuxjournal.com/content/everything-you-need-know-about-linux-containers-part-ii-working-linux-containers-lxc


SSH in a cgroup
https://unix.stackexchange.com/questions/209199/how-to-ensure-ssh-via-cgroups-on-centos

https://unix.stackexchange.com/questions/56538/controlling-priority-of-applications-using-cgroups

cgroupsv2
https://unix.stackexchange.com/questions/471476/how-do-i-check-cgroup-v2-is-installed-on-my-machine

