# README

Create a basic NFS share.

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

```sh
mkdir -p /srv/nfs4/nfs_videoshare
sudo mount --bind /home/chrisguest/shares/videoshare /srv/nfs4/nfs_videoshare

cat /etc/exports
sudo nano /etc/exports
```

Add a config for NFS exports

```txt
/srv/nfs4         192.168.1.0/24(rw,sync,no_subtree_check,crossmnt,fsid=0)
/srv/nfs4/backups 192.168.1.0/24(ro,sync,no_subtree_check) 
```


```sh
sudo exportfs -ar

# show shares
sudo exportfs -v

sudo systemctl restart nfs-kernel-server
```

## Configure clients



## Troubleshooting

```sh
sudo service nfs-kernel-server status

# 
nfsstat
```

## Removing NFS share

```sh
sudo nano /etc/exports
sudo umount /srv/nfs4/nfs_videoshare    
```

## Resources

* How to Install and Configure an NFS Server on Ubuntu 20.04 [here](https://linuxize.com/post/how-to-install-and-configure-an-nfs-server-on-ubuntu-20-04/)
* Install NFS Server and Client on Ubuntu [here](https://vitux.com/install-nfs-server-and-client-on-ubuntu/)
* Ubuntu docs SettingUpNFSHowTo [here](https://help.ubuntu.com/community/SettingUpNFSHowTo)
* NAS Performance: NFS vs. SMB vs. SSHFS [here](https://blog.ja-ke.tech/2019/08/27/nas-performance-sshfs-nfs-smb.html)
* NFS vs Samba - what's the trend nowadays? [here](https://www.reddit.com/r/linuxquestions/comments/b5ba8t/nfs_vs_samba_whats_the_trend_nowadays/
)



https://www.lacie.com/gb/en/support/kb/nas-connecting-via-nfs-on-osx-006626en/





https://unix.stackexchange.com/questions/198590/what-is-a-bind-mount