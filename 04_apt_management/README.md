# README
Demonstrates how to management various tasks with Apt

NOTE: This is very ubuntu flavoured.   

TODO:
* Pinning version 
* Patching.  

## Show out-of-date packages
```sh
# root shell
sudo su
# update apt cache
apt update
# show packages that can be upgraded
apt list --upgradable
```

## Upgrade to next major release of the distro
```sh
dist-upgrade
```

## Switch the HWE Kernel
Sometimes the version of the distro does not have the latest kernel features. This can be addressed by installing the HWE version. 

```sh
# kernel upgrades with hwe
sudo apt-get install --install-recommends linux-generic-hwe-18.04 
```




