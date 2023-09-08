# Processes

```sh
pidof zsh    
pgrep zsh        
```

```sh
# fuser - identify processes using files or sockets
fuser /bin/zsh
```

```sh
# process tress
ps -u --forest
```

```sh
# limits for current pid
cat /proc/$$/limits 
```

```sh
# top processes
top
htop
```

```sh
# systemd 
systemd-cgtop 
systemd-cgls
```
