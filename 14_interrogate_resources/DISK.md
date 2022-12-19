# DISK

The df utility displays statistics about the amount of free disk space on the specified filesystem or on the filesystem of which file is a part.  Values are displayed in 512-byte per block counts.  If neither a file or a filesystem operand is specified, statistics for all mounted filesystems are displayed.
     
```sh
# free space
df -h

# include inodes
df -iP
```

Display disk usage statistics

```sh
# disk usage (depth 1)q
du -h -d1 ./        
```

