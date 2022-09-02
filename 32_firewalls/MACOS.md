# MACOS FIREWALL

## Socket Filter

Application Firewall daemon

```sh
sudo /usr/libexec/ApplicationFirewall/socketfilterfw
```

## Packet Filter

Control the packet filter (PF) and network address translation (NAT) device

```sh
man pfctl

# disable
sudo pfctl -d

# enable
sudo pfctl -e
```

## Resources

https://lemp.io/how-to-modify-firewall-settings-mac-os-command-line/

