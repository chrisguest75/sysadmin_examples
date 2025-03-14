# DISK

## IO

iostat - Report Central Processing Unit (CPU) statistics and input/output statistics for devices and partitions.

```sh
iostat -x 1
```

## lsblk

lsblk lists information about all or the specified block devices. The lsblk command reads the sysfs filesystem to gather information.

```sh
lsblk 
```

## df

The df utility displays statistics about the amount of free disk space on the specified filesystem or on the filesystem of which file is a part.  Values are displayed in 512-byte per block counts.  If neither a file or a filesystem operand is specified, statistics for all mounted filesystems are displayed.  

```sh
# free space
df -h

# include inodes
df -iP
```

## du

Display disk usage statistics  

```sh
# disk usage (depth 1)q
du -h -d1 ./
```

