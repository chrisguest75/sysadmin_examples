# README
Capture DNS requests in from pods to pods.

```sh
# up and running
docker compose --profile dns up -d --build   
docker compose logs coredns   

# from host 
dig @0.0.0.0 -p 8053 host.chrisguest.com 
dig @0.0.0.0 -p 8053 www.google.com

# exec into client
docker exec -it $(docker ps --filter name=07_tcpdump_client_1 -q) /bin/bash
# inside client use resolver.
dig coredns
dig @coredns -p 53 host.chrisguest.com 
dig @coredns -p 53 server.chrisguest.com 

# 
docker compose logs client

# cleanup
docker compose --profile dns down
```

## Captures
```sh
tcpdump -w /scratch/captures/dns.pcap &
fg
dig @coredns -p 53 host.chrisguest.com 
dig @coredns -p 53 server.chrisguest.com 

man tcpdump
tcpdump -r ./captures/dns.pcap -vvv
tcpdump -r ./captures/dns.pcap -XX
tcpdump -r ./captures/dns.pcap -XX -S -e
```

# Resources
* dns-tcpdump [here](https://www.netmeister.org/blog/dns-tcpdump.html)  
* coredns docs [here](https://coredns.io/manual/toc/)  
* running-coredns-as-a-dns-server-in-a-container-1d [here](https://dev.to/robbmanes/running-coredns-as-a-dns-server-in-a-container-1d0)  
* corefile-explained [here](https://coredns.io/2017/07/23/corefile-explained/)  