# README

Demonstrate how to use `mitmproxy` as an intercepting proxy.  

## REASON

If you need to write webservices or use webservices having an intercepting proxy allows you to monitor the network traffic during development.  

TODO:

* mitmproxy Commands
* transparent and tls proxy https://earthly.dev/blog/mitmproxy/
* How to intercept a websocket and close it
* How do I get logs for the scripts?  

## 📋 Install

It can be installed from package managers.  

```sh
brew info mitmproxy

brew install mitmproxy

# config directory
ls ~/.mitmproxy
```

## 🧪 Quick test

Running `mitmproxy` locally  

```sh
# terminal
mitmproxy 

# in another shell
curl --proxy localhost:8080 http://mitm.it
```

There is a web management console.  

```sh
# terminal
mitmweb

# in another shell
open http://127.0.0.1:8081/
curl --proxy localhost:8080 http://mitm.it
```

## 🏠 Start

Setup a test environment.  

```sh
# start podinfo
docker compose up -d

mitmweb --listen-host 0.0.0.0 --listen-port 40000

# open web portal
open http://127.0.0.1:8081/

# check podinfo endpoints
curl -vvv --proxy localhost:40000 -i http://0.0.0.0:9001  
curl -vvv --proxy localhost:40000 -i http://0.0.0.0:9001/metrics  
curl -vvv --proxy localhost:40000 -i http://0.0.0.0:9001/panic

# post data
curl -vvv -X POST -d '{"user":"bob","pass":"123"}' --proxy localhost:40000 -i http://0.0.0.0:9001/echo
```

Set the intercept and repeat request.  It's possible to modify the payload like in fiddler.  

```txt
~u /echo & ~q
```

## Websockets

It can also be used to monitor websockets.  

```sh
brew install websocat

mitmweb --listen-host 0.0.0.0 --listen-port 40000 --mode socks5

# send one message
echo "Look at testing websockets" | websocat --text ws://0.0.0.0:9001/ws/echo -n --socks5 0.0.0.0:40000  

# you can type and send info over websockets
websocat --text ws://0.0.0.0:9001/ws/echo -n --socks5 0.0.0.0:40000  

docker compose logs podinfo 
```

## Intercepting Proxy (docker compose)

Use with normal client proxy configuration.  

```sh
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmproxy.yaml up -d --build --force-recreate

docker compose logs mitmproxy 

open http://0.0.0.0:8081    

curl -vvv --proxy 0.0.0.0:8080 -i http://podinfo:9898

# cleanup
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmproxy.yaml down    
```

## Intercepting Reverse Proxy (docker compose)

Use with reverse proxy configuration.  

```sh
# start proxy
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmreverseproxy.yaml up -d --build --force-recreate

# mitm logs
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmreverseproxy.yaml logs mitmproxy 

# open mitm console
open http://0.0.0.0:8081    

# this will intercept and call
curl -vvv -i http://0.0.0.0:8080

# websockets work as well
websocat --text ws://0.0.0.0:8080/ws/echo -n 

# cleanup
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmreverseproxy.yaml down  
```

## HTTPS

We can also use MITMProxy to intercept requests to TLS protected endpoints.  
Some help about `certificates` can be found [here](https://docs.mitmproxy.org/stable/concepts-certificates/)  

### Local

```sh
# local certificates
ls  ~/.mitmproxy/

# start proxy
mitmproxy 

# make request
curl -vvv --proxy 0.0.0.0:8080 --cacert ~/.mitmproxy/mitmproxy-ca-cert.pem -i https://www.google.com
```

### Docker

```sh
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmproxy.yaml up -d --build --force-recreate

# open mitm console
open http://0.0.0.0:8081

# copy certs from inside container
docker compose cp mitmproxy:/home/mitmproxy/.mitmproxy ./certs  

# make request
curl -vvv --proxy 0.0.0.0:8080 --cacert ./certs/.mitmproxy/mitmproxy-ca-cert.pem -i https://www.google.com

# enter container
docker compose exec -it mitmproxy /bin/bash      
ls -la /home/mitmproxy/.mitmproxy/

# cleanup
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmproxy.yaml down
```

## Scripts

MITMProxy has the ability to execute scripts on network events.  

```sh
# terminal
mitmweb -s ./scripts/flow-counter.py

# in another shell
open http://127.0.0.1:8081/
curl --proxy localhost:8080 http://mitm.it

# just podinfo
docker compose -f ./docker-compose.yaml up -d --build --force-recreate 

# start docker container
docker run -it --rm -v $(pwd)/scripts:/scripts -it -p 8080:8080 -p 8081:8081 mitmproxy/mitmproxy:8.1.1 mitmweb --verbose -s /scripts/websocket-simple.py  -s /scripts/flow-counter.py -s /scripts/random-outage.py --web-host 0.0.0.0 --mode reverse:http://host.docker.internal:9001

# start mitmweb in console
mitmweb --verbose -s ./scripts/websocket-simple.py  -s ./scripts/flow-counter.py -s ./scripts/random-outage.py --web-host 0.0.0.0 --mode reverse:http://0.0.0.0:9001

# send requests
curl -vvv -i http://0.0.0.0:8080
websocat --text ws://0.0.0.0:8080/ws/echo -n 

# cleanup
docker compose -f ./docker-compose.yaml
```

## 🧼 Clean up

Shutdown the test environment  

```sh
docker compose down
```

## 👀 Resources

* mitmproxy is a free and open source interactive HTTPS proxy. [here](https://mitmproxy.org/)
* stefanprodan/podinfo tag [here](https://hub.docker.com/r/stefanprodan/podinfo/tags)
* stefanprodan/podinfo repo [here](https://github.com/stefanprodan/podinfo)  
* websocat repo [here](https://github.com/vi/websocat/blob/master/doc.md)  
* mitmproxy Modes of Operation [here](https://docs.mitmproxy.org/stable/concepts-modes/)  
* mitmproxy 9.0.0 [here](https://mitmproxy.org/posts/releases/mitmproxy9/)  
* mitmproxy dockerhub [here](https://hub.docker.com/r/mitmproxy/mitmproxy/tags)  

### Example Scripts

* KevCui/mitm-scripts repo [here](https://github.com/KevCui/mitm-scripts)
* lucaslegname/mitmproxy-helpers repo [here](https://github.com/lucaslegname/mitmproxy-helpers)  
* Dedicated Example Addons [here](https://docs.mitmproxy.org/stable/addons-examples/)  
* mitmproxy/mitmproxy examples [here](https://github.com/mitmproxy/mitmproxy/tree/main/examples/contrib)  
* KOLANICH-tools/wsreplay.py [here](https://github.com/KOLANICH-tools/wsreplay.py)  

### Script Blogs

* mitmproxy scripts [here](https://howdoitestthat.com/mitmproxy-scripts)
* Creating scripts for mitmproxy [here](https://lucaslegname.github.io/mitmproxy/2020/11/04/mitmproxy-scripts.html)  
* Ability to close websocket connection from script? [here](https://github.com/mitmproxy/mitmproxy/issues/4240)  
