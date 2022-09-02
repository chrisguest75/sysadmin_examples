# IPV6

Some notes on working with IPv6.  

TODO:

* ndisc6
* ndp
* Create a tcpdump of a ping
* Scopes
* WIFI and locating neighbors

## Documentation

```sh
apropos ipv6
```



## Config

```sh
ip link show 
ip addr show wlp3s0 
ls /proc/sys/net/ipv6/conf/all 
```

## Addresses

```sh
# hosts file has ipv4 and ipv6
cat /etc/hosts              

# loopback 
ping6 "::1"
http://[::1]:80/

ping6 "::ffff:127.0.0.1"  

# ping all nodes 
ping6 ff02::1%<interface>

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

```

## Find local neighbours

IPv6 uses NDP (Neightbour Discovery Protocol) over ARP.  

```sh
# show ARP and NDP addresses on local network
ip neighbor

# on macosx
ndp -a 
```

## DNS (AAAA)

```sh
# google has an ipv6 endpoint
open https://ipv6.google.com/

# look for AAAA records
dig ipv6.google.com
dig www.google.com AAAA
```



* Scanning networks

https://iplocation.io/ipv4-to-ipv6


IPV6 github apis 

There are some ISPs that have no IPV4  

 

https://github.com/community/community/discussions/10539 

 

https://www.google.com/intl/en/ipv6/statistics.html 

 

https://www.showmyip.com/ 

 

Ipv6 reasons  

https://jvns.ca/blog/2022/01/29/reasons-for-servers-to-support-ipv6/ 

 

Carrier grade nat. nat at isp level.  Not good for hosting.. 

https://en.m.wikipedia.org/wiki/Carrier-grade_NAT 

 

https://www.tutorialspoint.com/ipv6/ipv6_features.htm 

ipv6 routing? 

no dhcp? 

anycast? 

 

Whois for ipv6 address 

https://www.reddit.com/r/ipv6/comments/wpwhee/does_anyone_know_how_to_track_an_ipv6_address_i/?utm_source=share&utm_medium=android_app&utm_name=androidcss&utm_term=1&utm_content=share_button 

 

streaming in ipv6 - flow labels 

 

 

https://test-ipv6.com/ 

 

Ipv6 docker 

https://docs.docker.com/config/daemon/ipv6/ 

 

Decode ipv6 

http://v6decode.com/#address=%3A%3Affff%3A213.205.198.65 

 

Ipv6 nodejs 

https://blog.apify.com/ipv4-mapped-ipv6-in-nodejs/ 

 
## Resources

https://github.com/fgont/ipv6toolkit
https://en.wikipedia.org/wiki/IPv6_address

* A tiny javascript library to encode IPv6 and IPv4 addresses as haiku. [here](https://github.com/gabemart/hipku)
* Format for Literal IPv6 Addresses in URL's [here](https://www.rfc-editor.org/rfc/rfc2732)
* IP Version 6 Addressing Architecture [here](https://www.rfc-editor.org/rfc/rfc4291)


https://docs.microsoft.com/en-us/previous-versions/aa917150(v=msdn.10)?redirectedfrom=MSDN#reachability-scopes


* Why is there a percent sign '%' in the IPv6 address? [here](https://superuser.com/questions/99746/why-is-there-a-percent-sign-in-the-ipv6-address)

