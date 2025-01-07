# README

Demonstrates how to mount filesystems

## Find disks

```sh
# get which id's map to which devices
ls -lha /dev/disk/by-uuid
```

## Create a virtual hard drive

```sh
# create file
sudo dd if=/dev/zero of=vhd.img bs=1M count=1200

# create filesystem
sudo mkfs -t ext4 vhd.img

# mount vhd
sudo mkdir /mnt/vhd
sudo mount -t auto -o loop ./vhd.img /mnt/vhd

# view files
ls -la /mnt/vhd 

# look at mounts
mount
cat /proc/mounts 

# look at the filesystems 
df -hT
```

## Permanent mount

Permanent mounts are handled by fstab  

```NOTE:``` Skip to remove before trying this  

```sh
# view fstab file
cat /etc/fstab 

# Add the line below to fstab
# /media/VHD.img  /mnt/VHD/  ext4    defaults 
sudo nano /etc/fstab 

# Reload fstab to test config 
sudo mount -a  

ls -la /mnt/vhd 
```

## Remove mount

```sh
sudo umount /mnt/vhd
df -hT
ls -la /mnt/vhd 
```

## Resources

* How to Create a Virtual HardDisk Volume Using a File in Linux [here](https://www.tecmint.com/create-virtual-harddisk-volume-in-linux/)  
* [fstab](https://wiki.archlinux.org/index.php/Fstab)  
