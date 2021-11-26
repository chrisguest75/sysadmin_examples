# README

Demonstrate how to get aarch64 machine running on qemu (ubuntu)

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




## Resources
* https://www.qemu.org/docs/master/

* [RASPBERRY PI ON QEMU](https://azeria-labs.com/emulate-raspberry-pi-with-qemu/)
* [Docker over SSH & Qemu : Replacing Docker for Mac](https://dev.to/jillesvangurp/docker-over-qemu-on-a-mac-1ajp)
* [How to launch ARM aarch64 VM with QEMU from scratch.](https://futurewei-cloud.github.io/ARM-Datacenter/qemu/how-to-launch-aarch64-vm/)
https://libvirt.org/

https://raspberrypi.stackexchange.com/questions/117234/how-to-emulate-raspberry-pi-in-qemu
https://superuser.com/questions/1087859/how-to-quit-the-qemu-monitor-when-not-using-a-gui



```sh
mkdir ./qemu_vm
cd ./qemu_vm

curl -o 2021-10-30-raspios-bullseye-arm64.zip https://downloads.raspberrypi.org/raspios_arm64/images/raspios_arm64-2021-11-08/2021-10-30-raspios-bullseye-arm64.zip

unzip ./2021-10-30-raspios-bullseye-arm64.zip

fdisk -l ./2021-10-30-raspios-bullseye-arm64.img

echo $((512 * 532480))

sudo mkdir -p /mnt/raspbian

sudo mount -v -o offset=272629760 -t ext4 ./2021-10-30-raspios-bullseye-arm64.img /mnt/raspbian


# edits


sudo umount /mnt/raspbian

qemu-system-arm -kernel ~/qemu_vms/raspbian -cpu arm1176 -m 256 -M versatilepb -serial stdio -append "root=/dev/sda2 rootfstype=ext4 rw" -hda ./qemu_vms/2021-10-30-raspios-bullseye-arm64.img -redir tcp:5022::22 -no-reboot

```