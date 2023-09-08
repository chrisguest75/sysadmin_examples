# Checking Resources

Demonstrate how to use various commands to verify resource usage in the OS.

More examples [here](https://github.com/chrisguest75/ebpf-examples)

TODO:

* How to use /proc to get key information
* cgroups
* File handles
* Look at the brenden gregg resources http://www.brendangregg.com/linuxperf.html
* Filesystem
* Procfs
* debugfs

## Areas

[Disk](./DISK.md)  
[Memory](./MEMORY.md)  
[Network](./NETWORK.md)  
[Processes](./PROCESSES.md)  
[Hardware](./HARDWARE.md)  

## Simple test container

```sh
# limits inside a container
docker run --rm -it ubuntu:20.04 /bin/bash -c "ulimit -a" 
```

## Check limits

```sh
# limits on host
ulimit -a 

# limits for current pid
cat /proc/$$/limits 

# show global config
systemctl show    
```

## Boot Image

```sh
# BOOT_IMAGE options that we booted with
cat /proc/cmdline 

# Find options the BOOT_IMAGE was built with
cat /boot/config-5.8.0-49-generic | grep CGROUP

# global limits
systemctl show     
```

## SYSSTAT TOOLS

[sysstat](https://www.linux.com/training-tutorials/sysstat-howto-deployment-and-configuration-guide-linux-servers/) is a suite of tools.  

```sh
sudo apt install sysstat

# cpu usage
mpstat -A
iostat
pidstat
```

## Resources

* Troubleshooting RHEL - summary by topics [here](http://lofic.github.io/tips/troubleshooting-by-topics.html)  
