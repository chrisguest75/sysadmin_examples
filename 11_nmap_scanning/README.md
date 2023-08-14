# README

Demonstrate some network discovery examples

TODO:

* Debugging home networking.

## Install

NOTE: To run in `ish` you need to run as a non-root user. Details [here](https://github.com/ish-app/ish/wiki/Running-nmap)  

```sh
# install nmap
brew install nmap
apt install nmap

# ish on ipad (nmap scripts for lua)
apk add nmap
apk add nmap-scripts
```

## Find local neighbours

```sh
# show ip addresses on local network
ip neighbor

# NOTE: doesn't seem to show ipv6 neighbours
ip -6 neighbor
```

## Scan local network

```sh
# scan my local network
nmap -sn -vvv 192.168.1.0/24

# this does not always do reverse lookup
nmap -p 22 -sV -A -vvv 192.168.1.0/24

# -sV: Probe open ports to determine service/version info
nmap -sV -A -vvv 192.168.1.0/24

# NOTE: this does not show a reverse lookup
nmap -sV 192.168.1.0/24 -vvv -A --dns-servers 192.168.1.254
```

## Locate DHCP servers

```sh
# locate my local dhcp server (macosx)
ipconfig getpacket en0

# run dhcp daemon on interface (ubuntu)
sudo dhclient -d -nw wlx1cbfcec13467
```

## Resolve DNS using homerouter

```sh
# use my home router to find machine ip
dig @192.168.1.254 bigmonga
```

## Process NMAP

```sh
# scan network (save xml file)
nmap -p 22 -oX ./net.xml -vvv 192.168.1.0/24   

# show hosts that are up
xmllint --xpath '//host/status[@state="up"]/../address/@addr' ./net.xml
```

## IPv6

Scan a single IPv6 address.  

```sh
# take the global scope
ip -6 addr  
# 
GLOBAL_IPV6=2a00:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx
nmap -6 -sV ${GLOBAL_IPV6}
```

## Resources

* nmap.org [here](https://nmap.org/)  
* Scanning IPv6 Networks [here](https://www.dionach.com/blog/scanning-ipv6-networks/)  
