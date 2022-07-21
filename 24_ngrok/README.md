# README

Demonstrate how to use `ngrok` to host a service and make it publically available.  

```sh
brew install ngrok/ngrok/ngrok
```

```sh
ngrok config add-authtoken xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
cat  "/Users/$(whoami)/Library/Application Support/ngrok/ngrok.yml"
```

## Example

TODO: Use podinfo  

```sh
# just podinfo
docker run -it --rm -p 8080:8080 

# start mitmweb in console
mitmweb --verbose -s ./scripts/websocket-simple.py  -s ./scripts/flow-counter.py -s ./scripts/random-outage.py --web-host 0.0.0.0 --mode reverse:http://0.0.0.0:9001
# send requests
curl -vvv -i http://0.0.0.0:8080
websocat --text ws://0.0.0.0:8080/ws/echo -n 
# cleanup
docker compose -f ./docker-compose.yaml
```

## Resources

* ngrok Documentation [here](https://ngrok.com/docs)  
* getting-started [here](https://ngrok.com/docs/getting-started)  
