# WINDOWS SSH

SSH can be used on windows for Git  

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

## Resources
