# README

Demonstrate how to use `mitmproxy`  

TODO:

* mitmproxy Commands
* transparent and tls proxy
* How to intercept a websocket and close it

## 📋 Install

```sh
brew install mitmproxy

# config directory
ls ~/.mitmproxy
```

## 🧪 Quick test

```sh
# terminal
mitmproxy 

# in another shell
curl --proxy localhost:8080 http://mitm.it
```

```sh
# terminal
mitmweb

# in another shell
open http://127.0.0.1:8081/
curl --proxy localhost:8080 http://mitm.it
```

## 🏠 Start

```sh
# start 
docker compose up -d

mitmweb --listen-host 0.0.0.0 --listen-port 40000

# open web portal
open http://127.0.0.1:8081/

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
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmreverseproxy.yaml up -d --build --force-recreate

docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmreverseproxy.yaml logs mitmproxy 

open http://0.0.0.0:8081    

# this will intercept and call
curl -vvv -i http://0.0.0.0:8080

# websockets work as well
websocat --text ws://0.0.0.0:8080/ws/echo -n 

# cleanup
docker compose -f ./docker-compose.yaml -f ./docker-compose.mitmreverseproxy.yaml down  
```

## Scripts

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

```sh
docker compose down
```

## 👀 Resources

* mitmproxy is a free and open source interactive HTTPS proxy. [here](https://mitmproxy.org/)
* stefanprodan/podinfo tag [here](https://hub.docker.com/r/stefanprodan/podinfo/tags)
* stefanprodan/podinfo repo [here](https://github.com/stefanprodan/podinfo)  
* websocat repo [here](https://github.com/vi/websocat/blob/master/doc.md)  
* mitmproxy Modes of Operation [here](https://docs.mitmproxy.org/stable/concepts-modes/)  

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
