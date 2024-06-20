# INSTALL DISTRO

Demonstrate how to install a new distro.  

## Contents

- [INSTALL DISTRO](#install-distro)
  - [Contents](#contents)
  - [Online](#online)
  - [Download](#download)
  - [Import](#import)
  - [Configure](#configure)
  - [Restore VHDX](#restore-vhdx)
  - [Chezmoi](#chezmoi)
  - [Delete Distro](#delete-distro)
  - [Resources](#resources)

## Online

```powershell
wsl --list --online

$DISTRO_NAME="ubuntu-24.04"

wsl --install  ${DISTRO_NAME}

tee /etc/wsl.conf <<_EOF
[user]
default=${NEW_USER}

[boot]
systemd=true
_EOF

logout

wsl --terminate ${DISTRO_NAME}

wsl -d ${DISTRO_NAME}
```

Now jump to [chezmoi](#chezmoi)  

## Download

Ubuntu Releases [here](https://wiki.ubuntu.com/Releases)  
Goto [https://cloud-images.ubuntu.com/wsl](https://cloud-images.ubuntu.com/wsl)

```powershell
ls "${HOME}\Documents\"

mkdir "${HOME}\Documents\WSLDistros"
mkdir "${HOME}\Documents\WSLDistros\backups"
mkdir "${HOME}\Documents\WSLDistros\rootfs"
mkdir "${HOME}\Documents\WSLDistros\imported"

curl "https://cloud-images.ubuntu.com/wsl/kinetic/20230719/ubuntu-kinetic-wsl-amd64-wsl.rootfs.tar.gz" --output "${HOME}\Documents\WSLDistros\rootfs\ubuntu-kinetic-wsl-amd64-wsl.rootfs.tar.gz"

# 22.04
curl "https://cloud-images.ubuntu.com/wsl/jammy/20240314/ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz" --output "${HOME}\Documents\WSLDistros\rootfs\ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz"

# 24.04
curl "https://cloud-images.ubuntu.com/wsl/noble/current/ubuntu-noble-wsl-amd64-wsl.rootfs.tar.gz" --output "${HOME}\Documents\WSLDistros\rootfs\ubuntu-noble-wsl-amd64-wsl.rootfs.tar.gz"

ls "${HOME}\Documents\WSLDistros\rootfs"
```

## Import

```powershell
$DISTRO_NAME = "work_22_04_distro"
$DISTRO_NAME = "kernel_build_distro"

# 23.10
$ROOT_FS_ZIP = "ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz"
$ROOT_FS_ZIP = "ubuntu-kinetic-wsl-amd64-wsl.rootfs.tar.gz"
# 22.04
$ROOT_FS_ZIP = "ubuntu-jammy-wsl-amd64-wsl.rootfs.tar.gz"
# 24.04
$ROOT_FS_ZIP = "ubuntu-noble-wsl-amd64-wsl.rootfs.tar.gz"

# import
wsl --import $DISTRO_NAME "${HOME}\Documents\WSLDistros\imported\${DISTRO_NAME}" "${HOME}\Documents\WSLDistros\rootfs\${ROOT_FS_ZIP}"

ls "${HOME}\Documents\WSLDistros\imported"
```

## Configure

```powershell
# enter
wsl -d ${DISTRO_NAME} --cd ~

# configure user
NEW_USER=chrisguest
useradd -m -G sudo -s /bin/bash "$NEW_USER"
passwd "$NEW_USER"

tee /etc/wsl.conf <<_EOF
[user]
default=${NEW_USER}

[boot]
systemd=true
_EOF

logout

# terminate
wsl --terminate ${DISTRO_NAME}

# look a running status
wsl --list --verbose

# backup (this seems to signal the distro to shutdown then fails.)
# NOTE: This seems to be run inside a cmd prompt and then run pwsh - otherwise you get Error code: Wsl/Service/ERROR_SHARING_VIOLATION. 
# NOTE: I also got this working by performing `wsl --shutdown`
wsl --export ${DISTRO_NAME} "${HOME}\Documents\WSLDistros\backups\${DISTRO_NAME}__2023_12_10.vhdx" --vhd

ls "${HOME}\Documents\WSLDistros\backups\"

wsl -d ${DISTRO_NAME}
# change into home directory
wsl -d ${DISTRO_NAME} --cd ~
```

## Restore VHDX

Restore a distro from a backed up VHDX.  

```powershell
$BACKUP_SOURCE="my_22_04_distro"
$DISTRO_NAME="new_22_04_distro"
wsl --import ${DISTRO_NAME} "${HOME}\Documents\WSLDistros\imported\${DISTRO_NAME}" "${HOME}\Documents\WSLDistros\backups\${BACKUP_SOURCE}__2023_12_10.vhdx" --vhd 

wsl --list --verbose

wsl -d ${DISTRO_NAME}
```

## Chezmoi

REF: [chrisguest75/chezmoi_dotfiles/README.md](https://github.com/chrisguest75/chezmoi_dotfiles/blob/master/README.md)  

```sh
# look a running status
wsl --list --verbose

$DISTRO_NAME = "my_distro_test2"
wsl -d ${DISTRO_NAME}
```

## Delete Distro

```powershell
# NOTE: this deletes the vhdx file as well
wsl --unregister ${DISTRO_NAME}
```

## Resources

* How to install multiple instances of Ubuntu in WSL2 [here](https://cloudbytes.dev/snippets/how-to-install-multiple-instances-of-ubuntu-in-wsl2)  
