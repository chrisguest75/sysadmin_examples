# README

Demonstrate some simple examples using `caddy`  

## Image

```sh
docker pull caddy

# default page
docker run --name caddy -d --rm -p 8080:80 caddy
curl -vvv http://localhost:8080/
```

## Quick test

```sh
mkdir -p ./content
echo "hello world" > ./content/index.html
mkdir -p ./caddy_data

# override site
docker run --name caddy -d --rm -p 8080:80 -v $PWD/content/site:/usr/share/caddy -v caddy_data:/data caddy

curl -vvv http://localhost:8080/

docker stop caddy
```

## Resources

* Caddy 2 is a powerful, enterprise-ready, open source web server with automatic HTTPS written in Go. [here](https://hub.docker.com/_/caddy)
* caddyserver/caddy [here](https://github.com/caddyserver/caddy)
* Caddyfile Tutorial [here](https://caddyserver.com/docs/caddyfile-tutorial)
* JSON Config Structure [here](https://caddyserver.com/docs/json/)
* Deploying Web Apps with Caddy: A Beginner's Guide [here](https://betterstack.com/community/guides/web-servers/caddy/)
* Live Streaming Server Setup [here](https://xeiaso.net/blog/rtmp-server-setup-2020-01-11)  