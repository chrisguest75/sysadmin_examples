# README
Capture DNS requests in from pods to pods.

TODO:
* Add different rfc1035 records
* Do a NS delegation
* DNSSEC

## CoreDNS Test
```sh
# up and running
docker compose --profile dns up -d --build   
docker compose logs coredns   

# from host 
dig @0.0.0.0 -p 8053 host.chrisguest.com 
dig @0.0.0.0 -p 8053 www.google.com

# check the metrics endpoints https://coredns.io/plugins/metrics/
curl 0.0.0.0:9153/metrics 
curl 0.0.0.0:9253/metrics 


# exec into client
docker exec -it $(docker ps --filter name=07_coredns_tcpdump_client_1 -q) /bin/bash
# inside client use resolver.
dig coredns
dig @coredns -p 53 host.chrisguest.com 
dig @coredns -p 53 server.chrisguest.com 
dig @coredns -p 53 dns.chrisguest.com TXT

# 
docker compose logs client
```

## Captures
```sh
# man pages
man tcpdump

# start dump
tcpdump -w /scratch/captures/dns.pcap not arp and not rarp &

# perform queries
dig @coredns -p 53 www.google.com
dig @coredns -p 53 chrisguest.com 
dig @coredns -p 53 host.chrisguest.com 
dig @coredns -p 53 server.chrisguest.com 
dig @coredns -p 53 dns.chrisguest.com TXT
# bring tcpdump back to foreground
fg
```

Look at pcap file.
```sh
tcpdump -r ./captures/dns.pcap -vvv
tcpdump -r ./captures/dns.pcap -XX
tcpdump -r ./captures/dns.pcap -XX -S -e
```

You can also drag and drop the pcap file into wireshark. 
## Cleanup
```sh
# cleanup
docker compose --profile dns down
```
# Resources
* dns-tcpdump [here](https://www.netmeister.org/blog/dns-tcpdump.html)  
* coredns docs [here](https://coredns.io/manual/toc/)  
* running-coredns-as-a-dns-server-in-a-container-1d [here](https://dev.to/robbmanes/running-coredns-as-a-dns-server-in-a-container-1d0)  
* corefile-explained [here](https://coredns.io/2017/07/23/corefile-explained/)  

## RFC1035

* File plugin docs [here](https://coredns.io/plugins/file/)  
* RFC1035 [here](https://www.rfc-editor.org/rfc/rfc1035.txt)
* Record formatting examples [here](https://www.cs.ait.ac.th/~on/O/oreilly/tcpip/dnsbind/appa_01.htm)  