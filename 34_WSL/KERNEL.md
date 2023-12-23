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

## Building

```sh
cd ~
mkdir Code/oss

cd Code/oss
git clone https://github.com/microsoft/WSL2-Linux-Kernel.git

git switch linux-msft-wsl-6.1.y

# need dwarves as well
sudo apt update && sudo apt install dwarves build-essential flex bison libssl-dev libelf-dev bc

# build kernel
sudo make -j$(nproc) KCONFIG_CONFIG=Microsoft/config-wsl

sudo make modules_install headers_install

mkdir -p /mnt/c/kernels
cp arch/x86/boot/bzImage /mnt/c/kernels
```

## Resources

* https://wsl.dev/wslcilium/
* https://learn.microsoft.com/en-us/community/content/wsl-user-msft-kernel-v6
* https://harthoover.com/compiling-your-own-wsl2-kernel/
* https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig