# README

Create a basic NFS share.

```sh
sudo apt update
sudo apt install nfs-kernel-server
```

```sh
sudo cat /proc/fs/nfsd/versions

cat /etc/default/nfs-kernel-server
cat /etc/default/nfs-common
apt-file list nfs-kernel-server
```

```sh
mkdir -p /srv/nfs4/nfs_videoshare
sudo mount --bind /home/chrisguest/shares/videoshare /srv/nfs4/nfs_videoshare

# 
cat /etc/exports
```

```ini
/srv/nfs4         192.168.1.0/24(rw,sync,no_subtree_check,crossmnt,fsid=0)
/srv/nfs4/backups 192.168.1.0/24(ro,sync,no_subtree_check) 
```

sudo exportfs -ar
sudo exportfs -v


## Resources

https://unix.stackexchange.com/questions/198590/what-is-a-bind-mount

https://linuxize.com/post/how-to-install-and-configure-an-nfs-server-on-ubuntu-20-04/

https://askubuntu.com/questions/7117/which-to-use-nfs-or-samba

https://vitux.com/install-nfs-server-and-client-on-ubuntu/

https://www.lacie.com/gb/en/support/kb/nas-connecting-via-nfs-on-osx-006626en/

https://www.reddit.com/r/linuxquestions/comments/b5ba8t/nfs_vs_samba_whats_the_trend_nowadays/

NAS vs SMB vs SSHFS
https://blog.ja-ke.tech/2019/08/27/nas-performance-sshfs-nfs-smb.html
