# README

Demonstrate how to use `ngrok` to host a service and make it publically available.  

TODO:  

* Add some tests for websockets

## Prereqs

```sh
brew install ngrok/ngrok/ngrok
```

```sh
# go and get auth token
open https://ngrok.com/

ngrok config add-authtoken xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
cat  "/Users/$(whoami)/Library/Application Support/ngrok/ngrok.yml"
```

## Example

```sh
# just podinfo
docker run -it --rm --name podinfo -p 9898:9898 "stefanprodan/podinfo:6.1.6"

# start mitmweb in console
mitmweb --verbose --listen-port 8080 --web-host 0.0.0.0 --mode reverse:http://0.0.0.0:9898

# open console
open http://0.0.0.0:8081

# send requests
curl -vvv -i http://0.0.0.0:8080
websocat --text ws://0.0.0.0:8080/ws/echo -n 

# start ngrok 
ngrok http 8080           

# cleanup
docker stop podinfo
```

## Resources

* ngrok Documentation [here](https://ngrok.com/docs)  
* getting-started [here](https://ngrok.com/docs/getting-started)  
