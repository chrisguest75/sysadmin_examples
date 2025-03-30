# README

Demonstrate how to get aarch64 machine running on qemu (ubuntu)

NOTES:

* `armv6l-linux` & `armv7l-linux` are 32-bit, whereas `aarch64` is 64-bit

## Prereqs

```sh
sudo apt-get install qemu-system

# systems and img handler
ls -la /usr/bin/qemu-* 

# types of arm
qemu-efi-aarch64    #UEFI firmware for 64-bit ARM virtual machines
qemu-efi-arm        #UEFI firmware for 32-bit ARM virtual machines
```

## Versions

```sh
qemu-system-arm -version
qemu-system-arm -M  help

qemu-system-aarch64 -version  
qemu-system-aarch64 -M  help

# on debian
apt-file list qemu-kvm
apt-file list qemu-system   
```

## Install image

Based on [How to launch ARM aarch64 VM with QEMU from scratch.](https://futurewei-cloud.github.io/ARM-Datacenter/qemu/how-to-launch-aarch64-vm/)

```sh
# install
apt-get install qemu-system-arm
apt-get install qemu-efi-aarch64
apt-get install qemu-utils

# prepare images
dd if=/dev/zero of=flash1.img bs=1M count=64
dd if=/dev/zero of=flash0.img bs=1M count=64
dd if=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd of=flash0.img conv=notrunc

# download ubuntu image
wget http://ports.ubuntu.com/ubuntu-ports/dists/bionic-updates/main/installer-arm64/current/images/netboot/mini.iso

# prepare image
mkdir -p aarch64image
cd ./aarch64image
qemu-img create ubuntu-image.img 20G

# install (this takes a long time and requires input)
qemu-system-aarch64 -nographic -machine virt,gic-version=max -m 512M -cpu max -smp 4 \
-netdev user,id=vnet,hostfwd=:127.0.0.1:0-:22 -device virtio-net-pci,netdev=vnet \
-drive file=ubuntu-image.img,if=none,id=drive0,cache=writeback -device virtio-blk,drive=drive0,bootindex=0 \
-drive file=mini.iso,if=none,id=drive1,cache=writeback -device virtio-blk,drive=drive1,bootindex=1 \
-drive file=flash0.img,format=raw,if=pflash -drive file=flash1.img,format=raw,if=pflash 

# To exit the VM user CTRL+A X
# QEMU monitor user CTRL+A C

# restart it 
qemu-system-aarch64 -nographic -machine virt,gic-version=max -m 512M -cpu max -smp 4 \
-netdev user,id=vnet,hostfwd=:127.0.0.1:0-:22 -device virtio-net-pci,netdev=vnet \
-drive file=ubuntu-image.img,if=none,id=drive0,cache=writeback -device virtio-blk,drive=drive0,bootindex=0 \
-drive file=flash0.img,format=raw,if=pflash -drive file=flash1.img,format=raw,if=pflash 
```

## Querying KVM

```sh
sudo apt install libvirt-clients 
```

## Resources

* Welcome to QEMU’s documentation! [here](https://www.qemu.org/docs/master/)
* RASPBERRY PI ON QEMU [here](https://azeria-labs.com/emulate-raspberry-pi-with-qemu/)
* Docker over SSH & Qemu : Replacing Docker for Mac [here](https://dev.to/jillesvangurp/docker-over-qemu-on-a-mac-1ajp)
* How to launch ARM aarch64 VM with QEMU from scratch. [here](https://futurewei-cloud.github.io/ARM-Datacenter/qemu/how-to-launch-aarch64-vm/)
* libvirt virtualisation API [here](https://libvirt.org/)
* How to emulate Raspberry Pi in QEMU? [here](https://raspberrypi.stackexchange.com/questions/117234/how-to-emulate-raspberry-pi-in-qemu)
* How to quit the QEMU monitor when not using a GUI? [here](https://superuser.com/questions/1087859/how-to-quit-the-qemu-monitor-when-not-using-a-gui)
