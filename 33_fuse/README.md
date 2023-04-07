# FUSE

Demonstrate some examples of using FUSE.  

FUSE  (Filesystem  in  Userspace) is a simple interface for userspace programs to export a virtual filesystem to the Linux kernel. FUSE also aims to provide a secure method for  non privileged users to create and mount their own filesystem implementations.  

## Install

```sh
# show packages for fuse
apt search fuse

# check fuse
modprobe fuse  
```

## Create an ISO

```sh
# download a filesystem we can put in an iso
mkdir -p ./download

curl -o ./download/alpine-minirootfs-3.17.3-x86_64.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.17/releases/x86_64/alpine-minirootfs-3.17.3-x86_64.tar.gz

tar --strip-components=1 --directory=./download/ -xzvf ./download/alpine-minirootfs-3.17.3-x86_64.tar.gz

sudo apt install mkisofs  
mkisofs -o test.iso ./download
```

## fuseiso

```sh
# install
sudo apt install fuseiso  

man fuseiso        

# mount
mkdir -p ./mountediso   
fuseiso ./test.iso ./mountediso   

ls mountediso   

mount

# cleanup
fusermount3 -u ./mountediso       

ls mountediso   

mount
```

## Resources
  
* Filesystem in Userspace [here](https://en.wikipedia.org/wiki/Filesystem_in_Userspace)  
* fuse - configuration and mount options for FUSE file systems [here](https://manpages.ubuntu.com/manpages/jammy/man8/mount.fuse.8.html)  
* FUSE [here](https://www.kernel.org/doc/html/latest/filesystems/fuse.html)
* koding/awesome-fuse-fs repo [here](https://github.com/koding/awesome-fuse-fs)  
* Write a filesystem with FUSE [here](https://engineering.facile.it/blog/eng/write-filesystem-fuse/)
* libfuse/libfuse [here](https://github.com/libfuse/libfuse)
* Alpine Linux downloads [here](https://alpinelinux.org/downloads/)  
