# README

Capture DNS requests in tcpdump from pods to pods.

* DNS examples [github.com/chrisguest75/shell_examples/78_dns/README.md](https://github.com/chrisguest75/shell_examples/blob/master/78_dns/README.md)  

TODO:

* Add different rfc1035 records https://www.netmeister.org/blog/dns-rrs.html
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

# start dump capture
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

## Capture coredns forwarding

Based on sidecar debugging example [here](https://github.com/chrisguest75/docker_build_examples)  

```sh
# build the tools container
docker build -f ./client/Dockerfile.client -t client ./client

# run the tools container (sharing pid and network namespaces)
docker run --privileged -it -v $(pwd)/captures:/scratch/captures --rm --pid=container:$(docker ps --filter name=07_coredns_tcpdump_coredns_1 -q) --network=container:$(docker ps --filter name=07_coredns_tcpdump_coredns_1 -q) --name tcpdump_sidecar --entrypoint /bin/bash client

# verify processes (in tcpdump_sidecar)
ps -aux
ip addr

# should only see two containers (on host)
docker network inspect 07_coredns_tcpdump_service_bridge

# tcpdump from sidecar (on tcpdump_sidecar)
tcpdump -w /scratch/captures/coredns.pcap not arp and not rarp &

# make a dns request (on client)
dig @coredns -p 53 www.google.com

# analyse the dump
tcpdump -r ./captures/coredns.pcap -XX -S -e

docker stop $(docker ps --filter name=tcpdump_sidecar -q) 
```

## Cleanup

```sh
# cleanup
docker compose --profile dns down
```

## Resources

* DNS RR [here](https://www.netmeister.org/blog/dns-rrs.html)  
* dns-tcpdump [here](https://www.netmeister.org/blog/dns-tcpdump.html)  
* coredns docs [here](https://coredns.io/manual/toc/)  
* running-coredns-as-a-dns-server-in-a-container-1d [here](https://dev.to/robbmanes/running-coredns-as-a-dns-server-in-a-container-1d0)  
* corefile-explained [here](https://coredns.io/2017/07/23/corefile-explained/)  
* tcpdump cheatsheet [here](https://cdn.comparitech.com/wp-content/uploads/2019/06/tcpdump-cheat-sheet.jpg)  

## RFC1035

* File plugin docs [here](https://coredns.io/plugins/file/)  
* RFC1035 [here](https://www.rfc-editor.org/rfc/rfc1035.txt)
* Record formatting examples [here](https://www.cs.ait.ac.th/~on/O/oreilly/tcpip/dnsbind/appa_01.htm)  

## Network namespace

* sharing-network-namespaces-in-docker [here](https://blog.mikesir87.io/2019/03/sharing-network-namespaces-in-docker/)  
