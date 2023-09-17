# Processes

TODO:

* tree view on bsd/mac

```sh
pidof zsh    
pgrep zsh        
```

```sh
# fuser - identify processes using files or sockets
fuser /bin/zsh
```

```sh
# process trees (gnu only)
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
