# README
Demonstrates how to get a VS Code Server running on machine so an IPad can connect to it. 

TODO:
* Had some issues with copy paste
* Configuring extensions
* Get the dockerised version running.

## Setup
The code server repo is available [here](https://github.com/cdr/code-server)  

https://coder.com/docs/code-server/v3.12.0/install


Install and run this on a local server
```sh
# dry run
curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run

# install it
curl -fsSL https://code-server.dev/install.sh | sh
```

After installation start code-server
```sh
# run in shell 
code-server

# run as service
systemd start code-server
sudo systemctl enable —now code-server@$USER
```

## Config
```sh
# config is stored in config.yaml
~/.config/code-server/config.yaml
cat ~/.config/code-server/config.yaml                                               
```

```yaml 
bind-addr: 192.168.1.xxx:12000
auth: password
password: ******
cert: false
```

# Resources
* Blog installing-vscode-server-on-remote-machine-in-private-network-offline-installation [here](https://medium.com/@debugger24/installing-vscode-server-on-remote-machine-in-private-network-offline-installation-16e51847e275)
* Dockerised code server [here](https://github.com/linuxserver/docker-code-server)

 





