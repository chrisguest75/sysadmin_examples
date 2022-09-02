# README

Demonstrate some examples of using tcpdump.  

## Find interface

```sh
# list interfaces
tcpdump -D 

# ipv4
arp -a 
# ipv6
ndp -a 
```

## IPv6

```sh
mkdir -p ./captures
```

```sh
# ipv6 icmp captures
tcpdump -i en0 -nn ip6 proto 58 -w ./captures/icmp.pcap 
ping6 2a00:23c6:2981:cc01:27d6:c124:666:11b1
wireshark -r ./captures/icmp.pcap    
```

```sh
# proto 6 is TCP
tcpdump -i en0 -nn ip6 proto 6 -w ./captures/tcp6.pcap 
curl https://ipv6.google.com
wireshark -r ./captures/tcp6.pcap        
```

## Resources

* https://www.linuxjournal.com/content/tcpdump-fu
* https://hackertarget.com/tcpdump-examples/
* https://www.tcpdump.org/manpages/tcpdump.1.html

* https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
* https://www.iana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml

https://blog.apnic.net/2019/10/18/how-to-ipv6-neighbor-discovery/