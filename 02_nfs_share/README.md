# README

Create a basic NFS share and demonstrate client connectivity.

Benefits of NFS or Samba [here](https://askubuntu.com/questions/7117/which-to-use-nfs-or-samba)  

## Prereqs

```sh
sudo apt update
sudo apt install nfs-kernel-server

# show installed files
apt-file list nfs-kernel-server
```

## View existing configs

```sh
# supported versions '-' means unsupported
sudo cat /proc/fs/nfsd/versions

cat /etc/default/nfs-kernel-server
cat /etc/default/nfs-common
```

## Create share

```sh
# create folder to share
mkdir -p /mnt/nfs_share
sudo chown nobody:nogroup /mnt/nfs_share
sudo chmod 777 /mnt/nfs_share     
```

Add exports

```sh
# edit exports
cat /etc/exports
sudo nano /etc/exports
```

Add a config for NFS exports

```txt
# config for /etc/exports
/mnt/nfs_share 192.168.1.0/24(rw,sync,no_subtree_check)
```

```sh
sudo exportfs -ar

# show shares
sudo exportfs -v

# restart service if required
sudo systemctl restart nfs-kernel-server
```

## Mount a folder into mounted folder

```sh
# bind mount on the server
sudo mount --bind /home/chrisguest/shares/videoshare /mnt/nfs_share
```

## Configure clients

```sh
# create a dummy file to be shared
touch /mnt/nfs_share/hello.txt 
```

On client machines create a share.

```sh
# debian
apt list nfs-common 
mkdir -p /mnt/clientshare
sudo mount 192.168.1.222:/mnt/nfs_share /mnt/clientshare


# macosx
mkdir -p /Volumes/clientshare
sudo mount -o nolocks -o resvport -t nfs 192.168.1.222:/mnt/nfs_share /Volumes/clientshare

# Remove client share if required
sudo umount /mnt/clientshare 
```

## Troubleshooting

```sh
# firewall status
sudo ufw status  

# service status
sudo service nfs-kernel-server status

# on client and server
rpcinfo -p 192.168.1.222

# syscall stats for nfs
nfsstat

# nfs4 
fgrep nfs4 /proc/kallsyms      

# in finder
nfs://192.168.1.222:/mnt/nfs_share
```

## Removing NFS share

```sh
# remove the shares
sudo nano /etc/exports

# remove the mount 
sudo umount /mnt/nfs_share  
```

## Resources

* How to Install and Configure an NFS Server on Ubuntu 20.04 [here](https://linuxize.com/post/how-to-install-and-configure-an-nfs-server-on-ubuntu-20-04/)
* Install NFS Server and Client on Ubuntu [here](https://vitux.com/install-nfs-server-and-client-on-ubuntu/)
* Ubuntu docs SettingUpNFSHowTo [here](https://help.ubuntu.com/community/SettingUpNFSHowTo)
* NAS Performance: NFS vs. SMB vs. SSHFS [here](https://blog.ja-ke.tech/2019/08/27/nas-performance-sshfs-nfs-smb.html)
* NFS vs Samba - what's the trend nowadays? [here](https://www.reddit.com/r/linuxquestions/comments/b5ba8t/nfs_vs_samba_whats_the_trend_nowadays/
)
* What is a bind mount? [here](https://unix.stackexchange.com/questions/198590/what-is-a-bind-mount)

### Troubleshooting

* General troubleshooting recommendations [here](http://wiki.linux-nfs.org/wiki/index.php/General_troubleshooting_recommendations)
* NFS/Troubleshooting [here](https://wiki.archlinux.org/title/NFS/Troubleshooting)
* Operation Not Permitted Mounting NFS Share on OS X Mountain Lion [here](https://thornelabs.net/posts/operation-not-permitted-mounting-nfs-share-on-os-x-mountain-lion.html)



