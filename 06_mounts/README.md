# README
Demonstrates how to mount filesystems 

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
ls /mnt/vhd 

# look at mounts
mount
df -hT
```

## Remove mount
```sh
sudo umount /mnt/vhd
df 
ls /mnt/vhd 
```

## Permanent mount
How do I permanently mount a drive? 

Use fstab.  

https://wiki.archlinux.org/index.php/Fstab 

?  ~ cat /etc/fstab 

/media/VHD.img  /mnt/VHD/  ext4    defaults 


Finding mounted partitions.   

cat /proc/mounts 

How do I unmount just the single share?   
 

How do I remove an entry from fstab? 

sudo nano /etc/fstab 

Remove the share path 

rmdir /mnt/shared/rnn 

 

Test fstab 

Sudo mount -a  

## Resources
[create-virtual-harddisk-volume-in-linux](https://www.tecmint.com/create-virtual-harddisk-volume-in-linux/)  


