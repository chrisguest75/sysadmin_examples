# BITWARDEN

NOTES:

* Free accounts for 2 users.  
* Has a secrets managet for automated processes.  
* Can be located in US or EU (when logging in be careful to select correct location or it can be confusing when password is not accepted)

## Install

Desktop

```sh
brew install bitwarden
```

CLI

```sh
brew install bitwarden-cli  
# or
nix-shell -p bitwarden-cli
```

## Login

```sh
# if configuring a tenant
bw config server https://vault.bitwarden.eu
# user and password
bw login

export BW_SESSION="xxxxxxxxxxxxxxxxxx"
bw list items

bw list items --search ssh
```

## SSH Agent

You can use the desktop appliction as an ssh agent. [Details](https://bitwarden.com/help/ssh-agent/).  

REF: [08_ssh/README.md](../08_ssh/README.md)  

## Resources

* https://bitwarden.com/
* https://bitwarden.com/help/github-actions-integration/
* https://bitwarden.com/help/ssh-agent/