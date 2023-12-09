# WINDOWS SSH

SSH can be used on windows for Git  

REF: [34_WSL/README.md](../34_WSL/README.md)

## Move WSL key to windows

```sh
# in wsl
cp ~/.ssh/id_ed25519.pub /mnt/c/Users/$(whoami)/.ssh
```

## Location in windows

```sh
# in command prompt
echo %USERNAME%
dir C:\Users\%USERNAME%\.ssh
```

### SSH Agent (WSL)

If you have passwords on your keys.  

```sh
eval $(ssh-agent -s)
ssh-add /home/${USER}/.ssh/id_ed25519
```

## Resources
