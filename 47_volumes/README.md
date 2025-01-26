# VOLUME MANAGMENT

* Physical Volume (PV) - A physical storage device (e.g., hard disk, SSD, or a partition) initialized for LVM.
* Volume Group (VG) - A pool of storage created by combining one or more Physical Volumes. VGs are the basis for creating logical volumes.
* Logical Volume (LV) - A virtual partition carved from a Volume Group. LVs act as dynamic partitions where you can store data.
* Physical Extent (PE) - The smallest storage unit in an LVM. LVM allocates disk space in these fixed-size chunks.


## Physical

```sh
lsblk
# inodes usage
df -i 

# physical volumes
pvs
```

## Volume Groups

```sh
# show groups
vgs
```

## Logical Volumes

```sh
# show logical volumes
lvs
```

## Extend

```sh
lvextend -L +10G /dev/mapper/ubuntu--vg-ubuntu--lv 
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv 
```

## Resources

