# IPV6

Some notes on working with IPv6.  

TODO:

* ndisc6
* Create a tcpdump of a ping
* Scopes
* WIFI and locating neighbors

## Notes

* Reasons to support IPv6 [here](https://jvns.ca/blog/2022/01/29/reasons-for-servers-to-support-ipv6/)  
* Test your ISP support for IPv6 [test-ipv6.com](https://test-ipv6.com/)
* SLAAC vs DHCPv6
* DAD (Duplicate Address Detection)
* CGNAT (Carrier Grade NAT) is a NAT at ISP level. Dynamically assigns IPv4. Not good for hosting. [Wikipedia](https://en.m.wikipedia.org/wiki/Carrier-grade_NAT)
* There are some ISPs that have no IPV4. Comments on lack of IPv6 Github APIs [here](https://github.com/community/community/discussions/10539)

Common Prefixes:  

| Prefixes  | Description  |
|-----------|--------------|
|::1        | ip6-localhost ip6-loopback |
|fe00::0    | ip6-localnet       |
|ff00::0    | ip6-mcastprefix |
|ff02::1    | ip6-allnodes        |
|ff02::2    | ip6-allrouters      |
|2001:db8   | non-routable |

## Documentation

```sh
apropos ipv6
```

## Config

```sh
# hosts file has ipv4 and ipv6
cat /etc/hosts              

# show the interfaces
ip link show 
# show addresses on interface
ip addr show wlp3s0 

# procfs details
ls /proc/sys/net/ipv6/conf/all 
```

## DNS (AAAA)

```sh
# google has an ipv6 endpoint
open https://ipv6.google.com/

# look for AAAA records
dig ipv6.google.com
dig www.google.com AAAA
```

## Addresses

```sh
# loopback 
ping6 "::1"
http://[::1]:80/

ping6 "::ffff:127.0.0.1"  

# ping all nodes 
ping6 ff02::1%<interface>
```

## Find local neighbours

IPv6 uses NDP (Neightbour Discovery Protocol) over ARP.  

```sh
# show ARP and NDP addresses on local network
ip neighbor

# on macosx
ndp -a 
```


## Scanning networks

https://iplocation.io/ipv4-to-ipv6
https://www.google.com/intl/en/ipv6/statistics.html 
https://www.showmyip.com/ 
https://www.tutorialspoint.com/ipv6/ipv6_features.htm 

ipv6 routing?  
no dhcp?  
anycast?  
Whois for ipv6 address  

https://www.reddit.com/r/ipv6/comments/wpwhee/does_anyone_know_how_to_track_an_ipv6_address_i/?utm_source=share&utm_medium=android_app&utm_name=androidcss&utm_term=1&utm_content=share_button 


streaming in ipv6 - flow labels 

Ipv6 docker - https://docs.docker.com/config/daemon/ipv6/  
Decode ipv6 - http://v6decode.com/  #address=%3A%3Affff%3A213.205.198.65 
Ipv6 nodejs - https://blog.apify.com/ipv4-mapped-ipv6-in-nodejs/  

 
## Resources

https://en.wikipedia.org/wiki/IPv6_address  

* A tiny javascript library to encode IPv6 and IPv4 addresses as haiku. [here](https://github.com/gabemart/hipku)
* Format for Literal IPv6 Addresses in URL's [here](https://www.rfc-editor.org/rfc/rfc2732)
* IP Version 6 Addressing Architecture [here](https://www.rfc-editor.org/rfc/rfc4291)
* Reachability Scopes [here](https://docs.microsoft.com/en-us/previous-versions/aa917150(v=msdn.10)?redirectedfrom=MSDN#reachability-scopes)
* Why is there a percent sign '%' in the IPv6 address? [here](https://superuser.com/questions/99746/why-is-there-a-percent-sign-in-the-ipv6-address)
* 2001:db8::/32 in the Wild [here](https://weberblog.net/2001db8-32-in-the-wild/)

https://github.com/fgont/ipv6toolkit  
