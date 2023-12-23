# KERNEL

TOOO:

* What options is my kernel currently built with?
* Build it in a dockerfile
* wsl windows app
* Add systemd to wsl using wsl.conf

```powershell
# MS kernel location
ls C:\windows\System32\lxss\tools\
```

```sh
# in powershell
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

sudo apt update && sudo apt install build-essential flex bison libssl-dev libelf-dev bc

sudo make -j$(nproc) KCONFIG_CONFIG=Microsoft/config-wsl

sudo make modules_install headers_install

cp arch/x86/boot/bzImage /mnt/c/
```


## Resources

* https://wsl.dev/wslcilium/
* https://learn.microsoft.com/en-us/community/content/wsl-user-msft-kernel-v6
* https://harthoover.com/compiling-your-own-wsl2-kernel/
* https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconfig