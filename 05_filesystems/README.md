# README
Demonstrates how to work with filesystems

TODO:  
* Read a file from disk using dd
## Filesystems 
```sh
# man pages about filesystems 
man -k filesystem
```

Show the mounted filesystems
```sh
df -Th
```

Use blkid to show filesystem of unmounted drive. 
```sh
blkid

# can use lsblk as well
lsblk -f
```

## Supported fielsystems 

```sh
locate mkfs
where mkfs
```


```sh
# disk usage
sudo du -csh /
```

## Fixing errors

```sh
sudo fsck --help 
```

