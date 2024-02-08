# Sysadmin Examples and Demos

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org) [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit)](https://github.com/pre-commit/pre-commit)  

A repository for showing examples of sysadmin types tasks.

## Conventional Commits

NOTE: This repo has switched to [conventional commits](https://www.conventionalcommits.org/en/v1.0.0). It requires `pre-commit` and `commitizen` to help with controlling this.  

```sh
# install pre-commmit (prerequisite for commitizen)
brew install pre-commit
brew install commitizen
# conventional commits extension
code --install-extension vivaxy.vscode-conventional-commits

# install hooks
pre-commit install --hook-type commit-msg --hook-type pre-push
```

## Contents

- [Sysadmin Examples and Demos](#sysadmin-examples-and-demos)
  - [Conventional Commits](#conventional-commits)
  - [Contents](#contents)
  - [Prequisites](#prequisites)
  - [01 - Configure a simple sambashare](#01---configure-a-simple-sambashare)
  - [02 - Configure a simple NFS share](#02---configure-a-simple-nfs-share)
  - [03 - User management](#03---user-management)
  - [04 - Apt Management](#04---apt-management)
  - [05 - Filesystems](#05---filesystems)
  - [06 - Mounts](#06---mounts)
  - [07 - Tcpdumping coredns](#07---tcpdumping-coredns)
  - [08 - SSH](#08---ssh)
  - [09 - CVE Processing](#09---cve-processing)
  - [10 - File permissions](#10---file-permissions)
  - [11 - NMap Network Scanning](#11---nmap-network-scanning)
  - [12 - Endpoint Vulnerability Scanning](#12---endpoint-vulnerability-scanning)
  - [13 - Code Server](#13---code-server)
  - [14 - Interrogate Resources](#14---interrogate-resources)
  - [15 - GPG Signing](#15---gpg-signing)
  - [16 - QEMU](#16---qemu)
  - [17 - Juypter](#17---juypter)
  - [18 - SOPS](#18---sops)
  - [19 - LetsEncrypt](#19---letsencrypt)
  - [20 - strace](#20---strace)
  - [22 - websockets reverse proxy](#22---websockets-reverse-proxy)
  - [23 - mitmproxy](#23---mitmproxy)
  - [24 - ngrok](#24---ngrok)
  - [25 - zfs](#25---zfs)
  - [26 - systemd](#26---systemd)
  - [27 - opsgenie](#27---opsgenie)
  - [28 - shodan](#28---shodan)
  - [29 - ipv6](#29---ipv6)
  - [31 - packet capture](#31---packet-capture)
  - [32 - firewalls](#32---firewalls)
  - [33 - fuse](#33---fuse)
  - [34 - WSL](#34---wsl)
  - [35 - processing logs](#35---processing-logs)
  - [36 - caddy](#36---caddy)
  - [37 - wifi](#37---wifi)

## Prequisites

* Vagrant is a useful tool  
  
My [vagrant_machines](https://github.com/chrisguest75/vagrant_machines) repo.  

## 01 - Configure a simple sambashare

Demonstrates how to create a simple sambashare  
Steps [README.md](./01_samba_share/README.md)  

## 02 - Configure a simple NFS share

Create a basic NFS share and demonstrate client connectivity.  
Steps [README.md](./02_nfs_share/README.md)  

## 03 - User management

Demonstrates how to perform some user management tasks.  
Steps [README.md](./03_usermanagement/README.md)  

## 04 - Apt Management

Demonstrates how to management various tasks with Apt  
Steps [README.md](./04_apt_management/README.md)  

## 05 - Filesystems

Demonstrates how to work with filesystems  
Steps [README.md](./05_filesystems/README.md)  

## 06 - Mounts

Demonstrates how to mount filesystems  
Steps [README.md](./06_mounts/README.md)  

## 07 - Tcpdumping coredns

Capture DNS requests in tcpdump from pods to pods.  
Steps [README.md](./07_coredns_tcpdump/README.md)  

## 08 - SSH

Demonstrates how to configure and use ssh  
Steps [README.md](./08_ssh/README.md)  

## 09 - CVE Processing

Demonstrates a script that will take a list of CVE and get the descriptions  
Steps [README.md](./09_cve_processing/README.md)  

## 10 - File permissions

Demonstrates some examples of using file permissions  
Steps [README.md](./10_file_permissions/README.md)  

## 11 - NMap Network Scanning

Demonstrate some network discovery examples  
Steps [README.md](./11_nmap_scanning/README.md)  

## 12 - Endpoint Vulnerability Scanning

Demonstrate how to use `metasploit` and `nmap` to scan for vulnerabilities.  
Steps [METASPLOIT.md](./12_endpoint_vulnerability_scanning/METASPLOIT.md)  
Steps [NMAP.md](./12_endpoint_vulnerability_scanning/NMAP.md)  

## 13 - Code Server

Demonstrates how to get a VS Code Server running on machine so an IPad can connect to it.  
Steps [README.md](./13_code_server/README.md)  

## 14 - Interrogate Resources

Demonstrate how to use various commands to verify resource usage in the OS.  
Steps [README.md](./14_interrogate_resources/README.md)  

## 15 - GPG Signing

Signing verified commits with gpg  
Steps [README.md](./15_code_server/README.md)  

## 16 - QEMU

Demonstrate how to get aarch64 machine running on qemu (ubuntu)  
Steps [README.md](./16_qemu/README.md)  

## 17 - Juypter

Demonstrate how to get a juypter server running  
Steps [README.md](./17_juypter/README.md)  

## 18 - SOPS

Demonstrate how to use Mozilla SOPS.  
Steps [README.md](./18_sops/README.md)  

## 19 - LetsEncrypt

Demonstrate using `letsencrypt` to generate a certificate  
Steps [README.md](./19_letsencrypt/README.md)  

## 20 - strace

Demonstrate some `strace` basics  
Steps [README.md](./20_strace/README.md)  

## 22 - websockets reverse proxy

Demonstrate and test websockets reverse proxy  
Steps [README.md](./22_websockets_reverse_proxy/README.md)  

## 23 - mitmproxy

Demonstrate how to use `mitmproxy`  
Steps [README.md](./23_mitmproxy/README.md)  

## 24 - ngrok

Demonstrate how to use `ngrok` to host a service and make it publically available.  
Steps [README.md](./24_ngrok/README.md)  

## 25 - zfs

Demonstrate some `zfs` examples  
Steps [README.md](./25_zfs/README.md)  

## 26 - systemd

Demonstrates some examples with `systemd`  
Steps [README.md](./26_systemd/README.md)  

## 27 - opsgenie

Demonstrate `opsgenie` cli management commands.  
Steps [README.md](./27_opsgenie/README.md)  

## 28 - shodan

Demonstrate a basic example of using `shodan`  
Steps [README.md](./28_shodan/README.md)  

## 29 - ipv6

Some notes on working with IPv6.  
Steps [README.md](./29_ipv6/README.md)  

## 31 - packet capture

Demonstrate how to perform packet capture using `tcpdump`, `tshark` and `wireshark`.  
Steps [README.md](./31_packet_capture/README.md)  

## 32 - firewalls

Firewall examples for different platforms.  
Steps [README.md](./32_firewalls/README.md)  

## 33 - fuse

Demonstrate some examples of using FUSE.  
Steps [README.md](./33_fuse/README.md)  

## 34 - WSL

Demonstrate WSL features and how to work with it.  
Steps [README.md](./34_WSL/README.md)  

## 35 - processing logs

Demonstrate how to use tooling to better work with logs.  
Steps [README.md](./35_processing_logs/README.md)  

## 36 - caddy

Demonstrate some simple examples using `caddy`  
Steps [README.md](./36_caddy/README.md)  

## 37 - wifi

Demonstrate how to get USB wifi driver on Ubuntu 22.04.3 LTS.  
Steps [README.md](./37_wifi/README.md)  
