# BIOS

## Version

```sh
sudo dmidecode 

# bios version
sudo dmidecode -s bios-version
```

## Firmware Updates

```sh
nix-shell -p fwupd --command zsh

fwupdtool --verbose --help
sudo fwupdtool get-updates 

fwupdmgr --help
```

## Resources

* https://www.cyberciti.biz/faq/check-bios-version-linux/
* How can I upgrade my device firmware from the command line? [here](https://askubuntu.com/questions/1394105/how-can-i-upgrade-my-device-firmware-from-the-command-line)