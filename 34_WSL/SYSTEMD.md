# SYSTEMD

Enabling SystemD in WSL.  

## Reason

The recommended way of running Nix is to have systemd enabled.  

## Enable

NOTE: It turns that if file is a windows file it fails.  

REF: [chrisguest75/shell_examples72_line_endings/README.md](https://github.com/chrisguest75/shell_examples/blob/master/72_line_endings/README.md)  

```sh
# should be a unix file
file /etc/wsl.conf 

# look at conf - systemd=true
cat /etc/wsl.conf

# look at control codes 0xd 0xa
cat /etc/wsl.conf | xxd

# dos2unix
sudo apt install dos2unix

# convert the file
sudo dos2unix /etc/wsl.conf
```

## Resources

* DeterminateSystems/nix-installer repo [here](https://github.com/DeterminateSystems/nix-installer)
* Systemd support is now available in WSL! [here](https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/)  
* Systemd units known to be problematic under WSL [here](https://github.com/arkane-systems/genie/wiki/Systemd-units-known-to-be-problematic-under-WSL)

### Issues

* System has not been booted with systemd as init system (PID 1). Can't operate. Failed to connect to bus: Host is down [here](https://github.com/microsoft/WSL/issues/8883#issuecomment-1345472665)  
