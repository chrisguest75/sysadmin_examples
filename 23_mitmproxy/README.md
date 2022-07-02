# README

Demonstrate how to use `mitmproxy`  

TODO:

* Intercept and modify - use podinfo?
* Commands

## 📋 Install

```sh
brew install mitmproxy
```

## Quick test

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

## 👀 Resources

* mitmproxy is a free and open source interactive HTTPS proxy. [here](https://mitmproxy.org/)
