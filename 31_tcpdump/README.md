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
ip -4 neighbor show  

# ipv6
ndp -a 
ip -6 neighbor show  
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

### Decrypting TLS

```sh
export SSLKEYLOGFILE=$(pwd)/captures/.ssl-key.log
echo $SSLKEYLOGFILE

sudo tcpdump -vvv -i any port 443 -w ./captures/google.pcap

curl https://www.google.com      
curl https://www.bing.com       
cat $SSLKEYLOGFILE

wireshark -r ./captures/google.pcap

rm $SSLKEYLOGFILE
rm ./captures/google.pcap


```

## Resources

* tcpdump fu [here](https://www.linuxjournal.com/content/tcpdump-fu)
* Tcpdump Examples [here](https://hackertarget.com/tcpdump-examples/)
* TCPDUMP(1) MAN PAGE [here](https://www.tcpdump.org/manpages/tcpdump.1.html)

* IANA Protocol Numbers [here](https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml)
* Internet Protocol Version 6 (IPv6) Parameters [here](https://www.iana.org/assignments/ipv6-parameters/ipv6-parameters.xhtml)







https://unit42.paloaltonetworks.com/wireshark-tutorial-decrypting-https-traffic/

https://www.comparitech.com/net-admin/decrypt-ssl-with-wireshark/


https://www.netmeister.org/blog/tcpdump-ssl-and-tls.html

https://www.netnea.com/cms/2022/01/20/decrypt-tls-encrypted-http-traffic-for-debugging/


tshark or tcpdump?
https://www.reddit.com/r/linuxadmin/comments/b0u4k8/tshark_or_tcpdump/


https://linuxhint.com/decrypt-ssl-tls-wireshark/


tcpdump -ttt -i eth0 udp port 2049
tcpdump -vvv -i any port 80 # Flags [S] = syn, [S.] = syn-ack, [.] = ack, [R] = rst, [F]=fin(ish), etc.
# Connection establishment : syn, syn-ack, ack
tcpdump -vvv -i any -c 100 -A 'port 80 and host 192.168.0.16'
tcpdump -i eth0 host 10.151.2.201 and 10.151.2.202
tcpdump -i eth0 not port 22

https://everything.curl.dev/usingcurl/tls/sslkeylogfile

