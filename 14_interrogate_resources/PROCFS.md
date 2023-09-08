# PROCFS

Use `/proc` to get information when no tools are installed.  

## Processes

```sh
# limits
cat /proc/$$/limits 

# list pids
ls /proc | grep '^[0-9]'

# get environment for pid
tr '\0' '\n' < /proc/1/environ
```

## Network

Structure of `/proc/net/tcp` [here](https://www.kernel.org/doc/Documentation/networking/proc_net_tcp.txt)  

```sh
cat /proc/net/tcp

hex_ip="04AAFEA9"
decimal_ip=$(printf "%d.%d.%d.%d" 0x${hex_ip:6:2} 0x${hex_ip:4:2} 0x${hex_ip:2:2} 0x${hex_ip:0:2})
echo $decimal_ip
```

## Resources
