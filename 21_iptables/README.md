# README

Demonstrate linux networking commands.  

TODO:

* 
https://www.nginx.com/blog/websocket-nginx/


* iptables
    * use iptables to test sockets.  
* What network interfaces exist?
* What routes exist?
* ping?  
* Ports bound to processes on interfaces?
    * Is it possible to open the same port on different interaces?  



Is it inefficient to bind to all interfaces 0.0.0.0?
List veth.


lo interface is the loopback.

cat /etc/services 


python3 -m http.server 
ss -plantu
curl http://0.0.0.0:8000/    

ip addr

ip route 

ip route show table local

ip -4 addr show dev lo

ip route get 142.250.179.238




https://askubuntu.com/questions/247625/what-is-the-loopback-device-and-how-do-i-use-it

https://tldp.org/LDP/nag/node66.html

https://askubuntu.com/questions/181041/how-is-the-loopback-device-implemented

https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking


https://www.kernel.org/doc/Documentation/networking/ipvlan.txt

Can I use iptables to create a faulty websocket?
https://www.howtogeek.com/177621/the-beginners-guide-to-iptables-the-linux-firewall/

https://spin.atomicobject.com/2012/10/01/useful-iptables-port-forwarding-patterns/

iptables protection for websockets
https://gist.github.com/valeriansaliou/9632580178e83da1dabce1bbe2cb6a76


hardening docker networking
https://docs.paloaltonetworks.com/cortex/cortex-xsoar/6-6/cortex-xsoar-admin/docker/docker-hardening-guide/docker-network-hardening

https://docs.docker.com/network/iptables/


https://www.reddit.com/r/docker/comments/uqado4/need_assistance_with_docker_macvlan/?utm_medium=android_app&utm_source=share


websocket nginx proxy
https://mpolinowski.github.io/devnotes/2021-09-09--websocket-NGINX/
