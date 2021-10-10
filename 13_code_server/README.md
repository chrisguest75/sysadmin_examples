# README
Demonstrates how to get a VS Code Server running on machine so an iPad can connect to it.  

NOTES:
* It works best in `Safari` when you add the app to the `homescreen`
* Set the text size on `Display & Brightness` to be smaller
* Set the `settings.json` in vscode


TODO:
* Had some issues with copy paste
* Configuring extensions 
* Get the dockerised version running.
* Preview in markdown does not work.

Chrome:
* Zoom or fullscreen does not work in chrome
* Lose some of bottom of screen to keyboard overlay

Safari:
* Lose some of bottom of screen to keyboard overlay
* If you turn off the iPad you sometimes have to connect back to `192.168.1.xxx:12000` using `Chrome`

## Setup
The code server repo is available [here](https://github.com/cdr/code-server)  

Some install and configuration instructions can also be found [here](https://coder.com/docs/code-server/v3.12.0/install).  

Install and run this on a local linux server.  I used `WebSSH` app to connect to perform the installation.   
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

config.yaml   
```yaml 
bind-addr: 192.168.1.xxx:12000
auth: password
password: ******
cert: false
```

# Resources
* Blog installing-vscode-server-on-remote-machine-in-private-network-offline-installation [here](https://medium.com/@debugger24/installing-vscode-server-on-remote-machine-in-private-network-offline-installation-16e51847e275)
* Dockerised code server [here](https://github.com/linuxserver/docker-code-server)

 





