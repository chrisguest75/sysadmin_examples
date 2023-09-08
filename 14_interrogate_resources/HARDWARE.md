# HARDWARE

## Simple test container

```sh
# limits inside a container
docker run --rm -it ubuntu:20.04 /bin/bash
```

## lshw

lshw: information about hardware configuration  

```sh
apt install lshw

# lshw - list hardware
lshw -json  | jq .

lsmem
lscpu
lsblk
lscpu
lsipc
lspci
```

## kmod

kmod: tools for managing Linux kernel modules  

```sh
apt install kmod

# lsmod - Show the status of modules in the Linux Kernel
lsmod

# modinfo - Show information about a Linux Kernel module
modinfo
```

## Resources
