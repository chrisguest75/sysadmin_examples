# README

Demonstrate some `zfs` examples  

NOTES:

* It looks like it might be dropped by ubuntu.  

## Background

ZFS (Zettabyte File System) is an advanced file system and logical volume manager originally developed by Sun Microsystems, which is now owned by Oracle Corporation. ZFS was designed to provide high storage capacity, data integrity, and scalability. It is often used in enterprise environments and for large-scale storage solutions.  

Some key features of ZFS include:  

* Pooled Storage: ZFS organizes storage devices into a storage pool, which can be easily expanded by adding new devices. The file system can then use storage from this pool as needed, simplifying storage management and improving performance.  

* Data Integrity: ZFS uses a checksumming mechanism to ensure data integrity. When data is written to disk, ZFS calculates a checksum and stores it alongside the data. When the data is read back, ZFS recalculates the checksum and compares it to the stored value, ensuring that data has not been corrupted.  

* Copy-on-Write: ZFS uses a copy-on-write mechanism, which means that when data is modified, it writes the changes to a new block on disk, rather than overwriting the original data. This approach improves data protection and enables features like snapshots and clones.  

* Snapshots and Clones: ZFS allows for the creation of snapshots, which are read-only, point-in-time copies of the file system. Clones can also be created, which are writable copies that share the same data with the original file system. This is made possible by ZFS's copy-on-write architecture.  

* Compression: ZFS supports transparent data compression, which can help reduce storage space requirements and improve performance.  

* Deduplication: ZFS can identify and remove duplicate data blocks, reducing storage space consumption and improving efficiency.  

* RAID-Z: ZFS offers a variety of RAID (Redundant Array of Independent Disks) levels, including RAID-Z, which provides data protection and redundancy similar to RAID-5 but without the "write hole" vulnerability.  

* Native encryption: ZFS supports native encryption, allowing users to secure their data at the file system level.  

* ZFS is available on various operating systems, including Solaris, FreeBSD, and Linux, through the OpenZFS project, which aims to maintain and develop an open-source implementation of ZFS.  

## Pools

In the context of ZFS, the terms "bpool," "zpool," and "rpool" refer to different types of storage pools. A storage pool is a collection of storage devices that ZFS manages and allocates space from as needed.  

*bpool*: The "bpool" or "boot pool" is a ZFS storage pool specifically created to store the boot environment or boot files of the operating system. It is separate from the main ZFS pool and is dedicated to storing the data required for the system to boot. This separation ensures that boot-related data remains protected, stable, and easy to manage, even when the main ZFS pool undergoes changes or modifications.  

*zpool*: The "zpool" is a generic term for a ZFS storage pool. It is the primary storage pool created and managed by ZFS, which contains datasets (file systems or volumes) used for storing data. The zpool can be easily expanded by adding new devices, and ZFS will automatically manage and distribute the available space among the datasets. Zpools can be configured with various RAID levels, such as RAID-Z, for redundancy and data protection.  

*rpool*: The "rpool" or "root pool" is another specific type of ZFS storage pool that contains the root file system of the operating system. The rpool is the primary ZFS pool used to store system-related data, including the operating system's configuration files, system libraries, and applications. Like the bpool, the rpool is separate from other ZFS pools and is specifically designed to ensure the stability and integrity of the system's essential data.  

In summary, bpool, zpool, and rpool are different types of ZFS storage pools that serve specific purposes. The bpool stores boot-related data, the rpool stores the root file system and system-related data, and the zpool is a general-purpose storage pool for user data and other datasets.  

## Install

```sh
sudo apt install zfsutils-linux
```

## ZPOOL 

The zpool command configures ZFS storage pools.  A storage pool is a collection of devices that provides physical storage and data replication for ZFS datasets.  All datasets within a storage pool share the same space.  

```sh
# check status of pools
zpool status
```

## ZFS

The zfs command configures ZFS datasets within a ZFS storage pool.   

```sh
zfs --help
```

```sh
# list 
zfs list

# list snapshots 
zfs list -t snapshot 

# get properties
zfs get all  
```

## Volumes



```sh
# create a volume
zfs create -s -V 20GB rpool/docker

# show volumes
zfs list -t volume      

# create a ext4 filesystem
mkfs.ext4 /dev/zvol/rpool/docker

# temporary mount
mkdir -p /mnt/docker      

# mount volume into temporary place
sudo mount /dev/zvol/rpool/docker /mnt/docker  

# copy files from docker into new volume in a root shell
sudo su 
cp -r /var/lib/docker/* /mnt/docker/
ls -l /mnt/docker
sudo umount /mnt/docker 

# now mount in replacement
sudo mount /dev/zvol/rpool/docker /var/lib/docker
```

## Docker

See snapshots being created.

```sh
# run a container
docker run --name hello-world hello-world  
# check the GraphDriver 
docker inspect hello-world | jq ".[].GraphDriver"   
# possible to see the snapshots.
sudo zpool events -v | grep -A 10 -B 10 "part of graphdriver id"

# get a history of commands 
sudo zpool history
```

## Troubleshooting

Status might tell you that the pool needs upgrading.  

`status`: The pool is formatted using a legacy on-disk format.  The pool can still be used, but some features are unavailable.  

`action`: Upgrade the pool using 'zpool upgrade'.  Once this is done, the pool will no longer be accessible on software that does not support feature flags.  

```sh
zpool upgrade

# lists the feature flags
zpool upgrade -v    
# upgrade pools 
sudo zpool upgrade bpool  
sudo zpool upgrade rpool  
```

### ZDB

The zdb utility displays information about a ZFS pool useful for debugging and performs some amount of consistency checking.  

```sh
zdb 
```

### Removing zombie snapshots

```sh
# attempting to remove containers might log an error
docker rm $(docker ps -aq)

> Error response from daemon: container 5276643f00a6f3e40736641f65085ad08a1276c3fd03e39e475db541fba4a35b: driver "zfs" failed to remove root filesystem: exit status 1: "/usr/sbin/zfs fs destroy -r rpool/ROOT/ubuntu_xd5gng/var/lib/e71e20a1763cc64e58f0ed38c60333fbd9342e390a3fb0946b696e3ef7416662" => cannot open 'rpool/ROOT/ubuntu_xd5gng/var/lib/e71e20a1763cc64e58f0ed38c60333fbd9342e390a3fb0946b696e3ef7416662': dataset does not exist
```

```sh
# check the storage driver is zfs.
docker info

# check the logs to see the failure
journalctl -b 0         

# list containers
sudo ls -la /var/lib/docker/containers    

# manually remove the folder
sudo rm -rf /var/lib/docker/containers/5276643f00a6f3e40736641f65085ad08a1276c3fd03e39e475db541fba4a35b

# restart docker
systemctl stop docker 
systemctl start docker 
```

## Resources

* Use the ZFS storage driver [here](https://docs.docker.com/storage/storagedriver/zfs-driver/)
* Setup a ZFS storage pool [here](https://ubuntu.com/tutorials/setup-zfs-storage-pool#1-overview)
* Solaris ZFS command line reference (Cheat sheet) [here](https://somedudesays.com/2021/08/the-basic-guide-to-working-with-zfs/)
* Understanding Container Images, Part 3: Working with Overlays [here](https://blogs.cisco.com/developer/373-containerimages-03)  
* OpenZFS Documentation [here](https://openzfs.github.io/openzfs-docs/)  
* Future of ZFS on Ubuntu desktop [here](https://discourse.ubuntu.com/t/future-of-zfs-on-ubuntu-desktop/33001)  
