# INSTALL DISTRO

Demonstrate how to install a new distro.  

## Download

Goto [https://cloud-images.ubuntu.com/wsl](https://cloud-images.ubuntu.com/wsl)

```powershell
ls '~\Documents\'

mkdir '~\Documents\WSLDistros'
mkdir '~\Documents\WSLDistros\backups'
mkdir '~\Documents\WSLDistros\rootfs'
mkdir '~\Documents\WSLDistros\imported'

# THIS IS NOT WORKING
#curl ("https://cloud-images.ubuntu.com/wsl/mantic/20231209/ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz") --output '~\Documents\WSLDistros\rootfs\ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz.test'

cp '~\Downloads\ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz' '~\Documents\WSLDistros\rootfs\'
```

## Import

```powershell
wsl --import my_distro_test 'C:\Users\Chris Guest\Documents\WSLDistros\imported\my_distro_test' 'C:\Users\Chris Guest\Documents\WSLDistros\rootfs\ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz'
```

## Configure

```powershell
wsl -d my_distro_test

NEW_USER=chrisguest
useradd -m -G sudo -s /bin/bash "$NEW_USER"
passwd "$NEW_USER"

tee /etc/wsl.conf <<_EOF
[user]
default=${NEW_USER}
_EOF

logout

wsl --terminate my_distro_test

wsl -d my_distro_test
```


## Resources

* How to install multiple instances of Ubuntu in WSL2 [here](https://cloudbytes.dev/snippets/how-to-install-multiple-instances-of-ubuntu-in-wsl2)  
