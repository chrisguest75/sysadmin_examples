# KERNEL

Building kernels for WSL.  

TOOO:

* What options is my kernel currently built with?
* Build it in a dockerfile
* wsl windows app
* Add systemd to wsl using wsl.conf

NOTES:

* Any issues with the kernel build will be logged in https://github.com/microsoft/WSL/issues

## Existing

```powershell
# MS kernel location
ls C:\windows\System32\lxss\tools\
```

```sh
# in powershell (do not exit this shell just close the tab)
wsl --debug-shell

# in wsl root
cat /etc/wsl.conf
zmore /proc/config.gz
```

## Building 6.1

### Create a WSL machine

For building kernels.  Goto [INSTALL_DISTRO.md](./INSTALL_DISTRO.md)

```powershell
wsl -d ${DISTRO_NAME} --cd ~
```

### Build

```sh
cd ~
mkdir -p Code/oss

cd Code/oss
git clone https://github.com/microsoft/WSL2-Linux-Kernel.git

git switch linux-msft-wsl-6.1.y

# need dwarves as well
sudo apt update && sudo apt install dwarves build-essential flex bison libssl-dev libelf-dev bc

# build kernel
sudo make -j$(nproc) KCONFIG_CONFIG=Microsoft/config-wsl

sudo make modules_install headers_install

# copy build 
mkdir -p /mnt/c/kernels
cp arch/x86/boot/bzImage /mnt/c/kernels/bzImage6_1

# shutdown existing wsl
wsl --shutdown

# copy my example wslconfig
cp kernel/.wslconfig6_1 $env:USERPROFILE/.wslconfig

# start with new kernel
wsl
# print out kernel build
uname -a
```

## Resources

* WSL2+Cilium: The rise of eBPF [here](https://wsl.dev/wslcilium/)
* How-to use the Microsoft Linux kernel v6 on Windows Subsystem for Linux version 2 (WSL2) [here](https://learn.microsoft.com/en-us/community/content/wsl-user-msft-kernel-v6)
* Compiling your own WSL2 Kernel for Cilium [here](https://harthoover.com/compiling-your-own-wsl2-kernel/)
* .wslconfig [here](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig)