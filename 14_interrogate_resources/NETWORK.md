# Network

## IP

```sh
# get ip sitting on a subnet.
ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep --color=never 192.168

# addresses, routes, interfaces
ip a  
ip r  
ip l               
```

## Sockets

### ss

ss - another utility to investigate sockets  

```sh
# summary of all the sockets
ss -s 

# listening sockets
ss -l 

# listening sockets with processes
sudo ss -lp

# tcp connections with information
ss -ti 

# tcp/udp, state, stats and addresses.
ss -plantu
```

### netstat

```sh
# list open sockets
netstat
```

## LSOF

```sh
# what is listening on a specific port?
sudo lsof -iTCP:49160 -sTCP:LISTEN

# what files does that process have open?
sudo lsof -p 362
```

## Nethogs

Nethogs tool [here](https://github.com/raboof/nethogs) shows traffic by process  

```sh
brew install nethogs

sudo nethogs
```
