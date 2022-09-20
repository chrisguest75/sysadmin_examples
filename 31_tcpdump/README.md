# README

Demonstrate some examples of using tcpdump.  

REF: [07_coredns_tcpdump/README.md](../07_coredns_tcpdump/README.md)  

TODO:  

* Capture TLS traffic and decode it
* Also use `tshark`.

## Find interface

NOTE: You can match the MAC addresses between IPv6 and IPv4 to determine the machine.  

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

Capture ping traffic over IPv6.  

```sh
# ipv6 icmp captures
tcpdump -i en0 -nn ip6 proto 58 -w ./captures/icmp.pcap 
# ping an ip from the list of ip addresses
ping6 fe80::xxxx:xxxx:xxxx:xxxx%en0
wireshark -r ./captures/icmp.pcap    
```

Capture tcp traffic.  

```sh
# proto 6 is TCP
tcpdump -i en0 -nn ip6 proto 6 -w ./captures/tcp6.pcap 
curl https://ipv6.google.com

# the traffic will be encrypted
wireshark -r ./captures/tcp6.pcap        
```

## Resources

* tcpdump fu [here](https://www.linuxjournal.com/content/tcpdump-fu)
* Tcpdump Examples [here](https://hackertarget.com/tcpdump-examples/)
* TCPDUMP(1) MAN PAGE [here](https://www.tcpdump.org/manpages/tcpdump.1.html)

* IANA Protocol Numbers [here](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)
* Internet Protocol Version 6 (IPv6) Parameters [here](https://www.iana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml)



### Decrypting TLS 

https://unit42.paloaltonetworks.com/wireshark-tutorial-decrypting-https-traffic/

https://www.comparitech.com/net-admin/decrypt-ssl-with-wireshark/


https://www.netmeister.org/blog/tcpdump-ssl-and-tls.html

https://www.netnea.com/cms/2022/01/20/decrypt-tls-encrypted-http-traffic-for-debugging/


tshark or tcpdump?
https://www.reddit.com/r/linuxadmin/comments/b0u4k8/tshark_or_tcpdump/