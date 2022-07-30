# README

Demonstrate some `zfs` examples   

```sh
zfs
sudo zpool status

status: The pool is formatted using a legacy on-disk format.  The pool can
	still be used, but some features are unavailable.
action: Upgrade the pool using 'zpool upgrade'.  Once this is done, the
	pool will no longer be accessible on software that does not support
	feature flags.

zpool upgrade
# lists the feature flags
zpool upgrade -v     
sudo zpool upgrade bpool  

```


```sh
# list 
zfs list

# list snapshots 
zfs list -t snapshot 

# get properties
zfs get all  

```


```sh
docker rm $(docker ps -aq)


Error response from daemon: container 5276643f00a6f3e40736641f65085ad08a1276c3fd03e39e475db541fba4a35b: driver "zfs" failed to remove root filesystem: exit status 1: "/usr/sbin/zfs fs destroy -r rpool/ROOT/ubuntu_xd5gng/var/lib/e71e20a1763cc64e58f0ed38c60333fbd9342e390a3fb0946b696e3ef7416662" => cannot open 'rpool/ROOT/ubuntu_xd5gng/var/lib/e71e20a1763cc64e58f0ed38c60333fbd9342e390a3fb0946b696e3ef7416662': dataset does not exist

Error response from daemon: container 850e37cf5c686434cb959e10a173d4c0e1430c8a83f6336aff5ecc69320e42da: driver "zfs" failed to remove root filesystem: exit status 1: "/usr/sbin/zfs fs destroy -r rpool/ROOT/ubuntu_xd5gng/var/lib/9aec31c557cef11d595e047f7ad8db6dc940d6793c844269daa5336392cc8887" => cannot open 'rpool/ROOT/ubuntu_xd5gng/var/lib/9aec31c557cef11d595e047f7ad8db6dc940d6793c844269daa5336392cc8887': dataset does not exist

It's leaving loads of filesystems behind. 
rpool/ROOT/ubuntu_xd5gng/var/lib/9aec31c557cef11d595e047f7ad8db6dc940d6793c844269daa5336392cc8887-init   256K  60.7G      352M  legacy
```

```sh
# check the storage driver.
docker info

journalctl -b 0         

sudo ls -la /var/lib/docker/containers    

sudo rm -rf /var/lib/docker/containers/5276643f00a6f3e40736641f65085ad08a1276c3fd03e39e475db541fba4a35b
systemctl stop docker 
systemctl start docker 
```

## Resources

https://docs.docker.com/storage/storagedriver/zfs-driver/

https://ubuntu.com/tutorials/setup-zfs-storage-pool#1-overview

https://somedudesays.com/2021/08/the-basic-guide-to-working-with-zfs/

https://blogs.cisco.com/developer/373-containerimages-03