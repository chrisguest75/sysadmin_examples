# Checking Resources

Demonstrate how to use various commands to verify resource usage in the OS.

More examples [here](https://github.com/chrisguest75/ebpf-examples)

TODO:

* cgroups
* File handles
* Look at the brenden gregg resources http://www.brendangregg.com/linuxperf.html
* Filesystem
* Procfs
* debugfs

## Areas

* [cgroups](./CGROUPS.md)  
* [Disk](./DISK.md)  
* [Memory](./MEMORY.md)  
* [Network](./NETWORK.md)  
* [Processes](./PROCESSES.md)  

## Boot Image

```sh
# BOOT_IMAGE options that we booted with
cat /proc/cmdline 

# Find options the BOOT_IMAGE was built with
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

## IO

[sysstat](https://www.linux.com/training-tutorials/sysstat-howto-deployment-and-configuration-guide-linux-servers/)  

```sh

sudo apt install sysstat   

# cpu usage
mpstat -A
```

## Resources

* Troubleshooting RHEL - summary by topics [here](http://lofic.github.io/tips/troubleshooting-by-topics.html)  