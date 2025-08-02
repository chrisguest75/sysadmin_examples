# TAILSCALE

REF: Hosting a docker container on tailnet [here](https://github.com/chrisguest75/docker_examples/tree/master/AA_tailscale)  

TODO:

* `tailscale set --stateful-filtering=false`?

NOTES:

* To use the host tailscale connection you'll need to use `--net=host` when running and `--network=host` during build

## External IP

```sh
curl -s 'https://api.ipify.org?format=json' | jq --raw-output .ip
```

## Start

Open a connection.  

```sh
tailscale up --accept-routes
```

## Switch ExitNode

Switch to another region.  

```sh
tailscale exit-node list 

tailscale set --exit-node=xx.xx.xx.xx
```

## Stop

```sh
tailscale down
```

## Resources

* Using Tailscale with Docker [here](https://tailscale.com/kb/1282/docker)
* A deep dive into using Tailscale with Docker [youtube](https://www.youtube.com/watch?v=tqvvZhGrciQ)