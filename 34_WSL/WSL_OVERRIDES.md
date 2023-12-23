# WSL OVERRIDES

You can configure eash distro using `wsl.conf`  

## SystemD

```sh
# copy my example wslconfig
cp wsl/wsl_systemd.conf /etc/wsl.conf 

# shutdown existing wsl
wsl --shutdown

# start with new config
wsl
```

## Resources

* https://learn.microsoft.com/en-us/windows/wsl/wsl-config#wslconf
