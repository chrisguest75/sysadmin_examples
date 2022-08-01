# README

Demonstrate some `zfs` examples  

## Example

```sh
zfs --help

# check status
sudo zpool status
```

```sh
# list 
zfs list

# list snapshots 
zfs list -t snapshot 

# get properties
zfs get all  
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
sudo zpool upgrade bpool  
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
