# HAPROXY

HAProxy - The Reliable, High Performance TCP/HTTP Load Balancer.  

TODO:

* NOT WORKING: Adding a server doesn't add to rotation
* Deleting servers does not seem to work either 
* Add another pod to backend and check hashing is consistent.
* logging websockets in podinfo
* stats?
* Multiple haproxies in federation - peers https://www.haproxy.com/documentation/haproxy-runtime-api/reference/show-peers/

NOTES:

* Consistent hashing vs Sticy Sessions

## Start

```sh
just start
```

## Test

```sh
# open in different terminal
just logs 

# test sticky sessions
just test sticky 

# this will rotate servers
websocat --text ws://0.0.0.0:8080/ws/echo -n 

# using sessionid to stick to a pod
websocat --header "X-Session-ID: abc123" --text ws://0.0.0.0:8080/ws/echo -n 
```

## Scale

```sh
# add a node
just scale

# register
echo "show servers state" | nc 0.0.0.0 9999
# sticky sessions
echo "add server webservers/s4 podinfo4:9898 check cookie s4" | nc 0.0.0.0 9999
# consistent hashing
echo "add server webservers/s4 podinfo4:9898 check" | nc 0.0.0.0 9999

echo "show servers state" | nc 0.0.0.0 9999
just test sticky 

# switching over sessions
curl -vvv -X GET http://0.0.0.0:8080/env -H "X-Session-ID: abc128"
```

## Management

```sh
echo "show info" | nc 0.0.0.0 9999
echo "show stat" | nc 0.0.0.0 9999
echo "show libs" | nc 0.0.0.0 9999
echo "show errors" | nc 0.0.0.0 9999
echo "show version" | nc 0.0.0.0 9999
echo "show activity" | nc 0.0.0.0 9999
echo "show servers state" | nc 0.0.0.0 9999
echo "add server webservers/s4 podinfo4:9898 check cookie s4" | nc 0.0.0.0 9999
echo "disable server webservers/s4" 
echo "del server webservers/s4" 
```

## Stop

```sh
just stop
```

## Resources

* [www.haproxy.com](https://www.haproxy.com)
* How to Run HAProxy With Docker (In-Depth Guide) [here](https://www.haproxy.com/blog/how-to-run-haproxy-with-docker)
* dockerhub haproxy [here](https://hub.docker.com/_/haproxy)
* HAProxy Docs [here](https://www.haproxy.com/documentation/haproxy-configuration-manual/latest/#3)
* haproxy/haproxy repo [here](https://github.com/haproxy/haproxy)
* An Introduction to HAProxy and Load Balancing Concepts [here](https://www.digitalocean.com/community/tutorials/an-introduction-to-haproxy-and-load-balancing-concepts)
* stefanprodan/podinfo [here](https://github.com/stefanprodan/podinfo)
* https://www.haproxy.com/blog/enable-sticky-sessions-in-haproxy
* https://www.haproxy.com/documentation/haproxy-runtime-api/