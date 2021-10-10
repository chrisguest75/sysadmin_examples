# README
Demonstrates how to get a VS Code Server running on machine so an IPad can connect to it. 

## Setup
The code server repo is available [here](https://github.com/cdr/code-server)

Install and run this on a local server
```sh
# dry run
curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run

# install it
curl -fsSL https://code-server.dev/install.sh | sh
```

After installation 
```sh
systemd start code-server
sudo systemctl enable —now code-server@$USER
```


```sh
config is stored in 
~/.config/code-server/config.yaml


cat ~/.config/code-server/config.yaml                                               

bind-addr: 192.168.1.xxx:12000
auth: password
password: ******
cert: false
```


# Resource
https://medium.com/@debugger24/installing-vscode-server-on-remote-machine-in-private-network-offline-installation-16e51847e275

Dockerised code server
https://github.com/linuxserver/docker-code-server

 
















