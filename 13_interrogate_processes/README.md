# Checking Resources 
Demonstrate how to use various commands to verify resource usage in the OS.


TODO:
* cgroups
* Open sockets
* Free memory 
* File handles
* Look at the brenden gregg resources http://www.brendangregg.com/linuxperf.html
* Filesystem
* Procfs
* debugfs
https://github.com/raboof/nethogs


```sh
# booted with
cat /proc/cmdline 

# built with
cat /boot/config-5.8.0-49-generic | grep CGROUP

# global limits
systemctl show     
```

## Check limits
```sh
# limits inside a container
docker run -it ubuntu:20.04 /bin/bash -c "ulimit -a" 

# limits on host
ulimit -a 

# limits for current pid
cat /proc/$$/limits 

# show global config
systemctl show    
```

## Disk

```sh
# free space
df -h
```

## Sockets

```sh
# summary of all the sockets
ss -s 

# listening sockets
ss -l 

# listening sockets with processes
sudo ss -lp

# tcp connections with information
ss -ti 
```

```sh
# what is listening on a specific port?
sudo lsof -iTCP:49160 -sTCP:LISTEN

# what files does that process have open?
sudo lsof -p 362
```


## Memory

```sh
free -h

vmstat 
```

## IO

[sysstat](https://www.linux.com/training-tutorials/sysstat-howto-deployment-and-configuration-guide-linux-servers/)  

```sh

sudo apt install sysstat   

# cpu usage
mpstat -A



```



top
systemd-cgtop   
systemd-analyze blame 

systemctl list-units -t service        


# Resources
