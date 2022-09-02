# MACOS FIREWALL

Examples of how to use firewall on MacOS  

TODO:  

* Find logs `console.app` does not seem to work.  

## Socket Filter

Application Firewall daemon

```sh
man socketfilterfw

# NOTE: You may get "Firewall settings cannot be modified from command line on managed Mac computers."
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate
```

## Packet Filter

Control the packet filter (PF) and network address translation (NAT) device

```sh
# manpages
man pfctl
```

```sh
# parameter list file
cat /System/Library/LaunchDaemons/com.apple.pfctl.plist

# default configs
cat /etc/pf.conf
cat /etc/pf.os
```

Stealh mode cannot be disabled under MDM management.  But disabling PF allows ICMP pings through.  

```sh
# disable 
sudo pfctl -d

# check disabled
sudo pfctl -s info | grep Status

# try a ping now
ping6 ::1

# enable
sudo pfctl -e
```

```sh
# 
sudo pfctl -s all
```

## Resources

* HOW TO MODIFY YOUR FIREWALL SETTINGS ON MAC OS USING THE PFCTL UTILITY [here](https://lemp.io/how-to-modify-firewall-settings-mac-os-command-line/)
* General PFCTL Commands [here](https://www.openbsdhandbook.com/pf/cheat_sheet/)
* Setting up correctly Packet Filter (pf) firewall on any macOS (from Sierra to Big Sur) [here](https://iyanmv.medium.com/setting-up-correctly-packet-filter-pf-firewall-on-any-macos-from-sierra-to-big-sur-47e70e062a0e)  
