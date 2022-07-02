# README

Demonstrates how to management various tasks with Apt

More apt examples [35_apt_and_dpkg](https://github.com/chrisguest75/shell_examples/tree/58f1a38e1ef9d32574ec2ca587bef082c811b02e/35_apt_and_dpkg)  

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

## Troubleshooting

Sometimes `apt update` will fail with key or tls failures

```sh
# apt update failures
sudo apt update

# show lists
ls -l /var/lib/apt/lists

# remove lists
rm /var/lib/apt/lists/*

# remove repositories list (target the removal to packages that are failing)
ls -l /var/apt/sources
ls -l /var/apt/sources.list.d
```
