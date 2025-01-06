# FDISK

fdisk - manipulate disk partition table

## Create

```sh
# list disks
sudo fdisk -l

# create a GPT 'g' and then new partition 'n' then 'w'
sudo fdisk /dev/sda

# create a filesystem
sudo mkfs.ext4 /dev/sda
```

## Resources

* How to Use Fdisk Format Partition in Linux [2024 Ultimate Guide](https://www.easeus.com/computer-instruction/fdisk-format-partition.html)
