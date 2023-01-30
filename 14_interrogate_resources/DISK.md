# DISK

Demonstrate disk operations and resource usage.  

The df utility displays statistics about the amount of free disk space on the specified filesystem or on the filesystem of which file is a part.  Values are displayed in 512-byte per block counts.  If neither a file or a filesystem operand is specified, statistics for all mounted filesystems are displayed.

## Drives

```sh
# free space on devices
df -h

# include inodes
df -iP
```

Display disk usage statistics

```sh
# disk usage (depth 1)q
du -h -d1 ./        

# disk usages
du -sh ../    
```

## Files

```sh
# file size in bytes 
stat --printf="%s" DISK.md  

du -b ./DISK.md         
```

## IO

```sh
sudo apt-get install sysstat    
sudo apt-get install iotop   

iostat -d 
sudo iotop  
```

## Resources 

* How to Monitor Disk IO in a Linux System [here](https://www.baeldung.com/linux/monitor-disk-io)

