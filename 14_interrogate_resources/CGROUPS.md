# README

Demonstrate how to work with `cgroups`

TODO:

* Demonstrate sshing into a cgroup to stop starvation

## cgroups

```sh
# man pages
man cgroups

# list filesystems and look at cgroups 
# nodev   cgroup
# nodev   cgroup2
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

# cgroups v2 (not on my ubuntu docker image on macosx)
ls /sys/fs/cgroup/unified     
```


## Resources

* The current adoption status of cgroup v2 in containers [here](https://medium.com/nttlabs/cgroup-v2-596d035be4d7)
* Managing resources with cgroups in systemd [here](https://opensource.com/article/20/10/cgroups)
* Everything You Need to Know about Linux Containers, Part I: Linux Control Groups and Process Isolation [here](https://www.linuxjournal.com/content/everything-you-need-know-about-linux-containers-part-i-linux-control-groups-and-process)
* Everything You Need to Know about Linux Containers, Part II: Working with Linux Containers (LXC) [here](https://www.linuxjournal.com/content/everything-you-need-know-about-linux-containers-part-ii-working-linux-containers-lxc)
* How to ensure ssh via cgroups on centos? SSH into a cgroup [here](https://unix.stackexchange.com/questions/209199/how-to-ensure-ssh-via-cgroups-on-centos)
* controlling priority of applications using cgroups [here](https://unix.stackexchange.com/questions/56538/controlling-priority-of-applications-using-cgroups)
* cgroupsv2 [here](https://unix.stackexchange.com/questions/471476/how-do-i-check-cgroup-v2-is-installed-on-my-machine)  

