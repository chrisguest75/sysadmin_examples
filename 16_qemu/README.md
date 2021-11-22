# README

Demonstrate how to get raspbian running on qemu

```sh
sudo apt-get install qemu-system

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

qemu-system-arm -version
qemu-system-arm -M  help


apt-file list qemu-kvm


qemu-efi-aarch64   UEFI firmware for 64-bit ARM virtual machines
qemu-efi-arm   UEFI firmware for 32-bit ARM virtual machines



## Resources
https://azeria-labs.com/emulate-raspberry-pi-with-qemu/
https://www.qemu.org/docs/master/
https://dev.to/jillesvangurp/docker-over-qemu-on-a-mac-1ajp


https://futurewei-cloud.github.io/ARM-Datacenter/qemu/how-to-launch-aarch64-vm/


https://raspberrypi.stackexchange.com/questions/117234/how-to-emulate-raspberry-pi-in-qemu


https://libvirt.org/