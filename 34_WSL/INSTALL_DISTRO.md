# INSTALL DISTRO

Demonstrate how to install a new distro.  

## Download

Goto [https://cloud-images.ubuntu.com/wsl](https://cloud-images.ubuntu.com/wsl)

```powershell
ls "${HOME}\Documents\"

mkdir "${HOME}\Documents\WSLDistros"
mkdir "${HOME}\Documents\WSLDistros\backups"
mkdir "${HOME}\Documents\WSLDistros\rootfs"
mkdir "${HOME}\Documents\WSLDistros\imported"

# THIS IS NOT WORKING
#curl ("https://cloud-images.ubuntu.com/wsl/mantic/20231209/ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz") --output '~\Documents\WSLDistros\rootfs\ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz.test'

cp "${HOME}\Downloads\ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz" "${HOME}\Documents\WSLDistros\rootfs\"
```

## Import

```powershell
$DISTRO_NAME = "my_distro_test2"
wsl --import $DISTRO_NAME "${HOME}\Documents\WSLDistros\imported\${DISTRO_NAME}" "${HOME}\Documents\WSLDistros\rootfs\ubuntu-mantic-wsl-amd64-wsl.rootfs.tar.gz"
```

## Configure

```powershell
# enter
wsl -d ${DISTRO_NAME}

# configure user
NEW_USER=chrisguest
useradd -m -G sudo -s /bin/bash "$NEW_USER"
passwd "$NEW_USER"

tee /etc/wsl.conf <<_EOF
[user]
default=${NEW_USER}
_EOF

logout

# terminate
wsl --terminate ${DISTRO_NAME}

# look a running status
wsl --list --verbose

# backup (this seems to signal the distro to shutdown then fails.)
wsl --export ${DISTRO_NAME} "${HOME}\Documents\WSLDistros\backups\${DISTRO_NAME}__2023_12_10.vhdx" --vhd

ls "${HOME}\Documents\WSLDistros\backups\"

wsl -d ${DISTRO_NAME}
```

## Delete Distro

```powershell
# NOTE: this deletes the vhdx file as well
wsl --unregister ${DISTRO_NAME}
```

## Resources

* How to install multiple instances of Ubuntu in WSL2 [here](https://cloudbytes.dev/snippets/how-to-install-multiple-instances-of-ubuntu-in-wsl2)  
