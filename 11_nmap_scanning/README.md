# README

Demonstrate some network discovery examples

TODO:

* Debugging home networking.

## Scan local network

```sh
# scan my local network
nmap -sn -vvv 192.168.1.0/24

# this does not always do reverse lookup
nmap -p 22 -sV -A -vvv 192.168.1.0/24

nmap -sV -A -vvv 192.168.1.0/24

# NOTE: this does not show a reverse lookup
nmap -sn 192.168.1.0/24 -vvv --dns-servers 192.168.1.254
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

## Resources

* https://nmap.org/