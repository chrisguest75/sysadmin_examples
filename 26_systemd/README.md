# README

Demonstrates some examples with `systemd`  

Creating a `systemd service` example [22_systemd_service](https://github.com/chrisguest75/shell_examples/tree/master/22_systemd_service/README.md).  
Some `journalctl` examples [here](https://github.com/chrisguest75/shell_examples/blob/master/27_journalctl/README.md).  

TODO: 

* Add a timer and a socket example.  

## Examples

* service [README.md](./service/README.md)
* timer [README.md](./timer/README.md)

## Help

```sh
# show unit types
systemctl list-units -t help  

# show help for different units
man systemd.unit
man systemd.service 
man systemd.timer
```

## Targets

A unit configuration file whose name ends in ".target" encodes information about a target unit of systemd, which is used for grouping units and as well-known synchronization points during start-up.

```sh
# list targets
systemctl list-units --type target
# show unit file for timers.target 
systemctl cat timers.target
```

## Services

A unit configuration file whose name ends in ".service" encodes information about a process controlled and supervised by systemd.

```sh
# Show properties of one or more units/jobs or the manager
systemctl show --no-pager   
```

```sh
# list services
systemctl list-units -t service --no-pager 
systemctl list-units -t service --state running

# status of service
systemctl status zfs-zed.service  

# list the unit files
systemctl cat zfs-import-cache.service 
```


## Sockets

A unit configuration file whose name ends in ".socket" encodes information about an IPC or network socket or a file system FIFO controlled and supervised by systemd, for socket-based activation.

```sh
systemctl list-units --type socket 
systemctl cat uuidd.socket     
```

## Timers

A unit configuration file whose name ends in ".timer" encodes information about a timer controlled and supervised by systemd, for timer-based activation.

```sh
systemctl list-timers --no-pager --all   
systemctl cat fstrim.timer         
```

## Run

```sh
systemd-run
systemd-run --user --on-calendar '*:0/1' ./script.sh --arg1
```

## Troubleshooting

```sh
# if a timer is failing to be removed "not-found"
systemctl reset-failed      

# what has failed?
systemctl --failed

# look at logs for a service
journalctl -b -u docker.service 

# top for systemd services
systemd-cgtop  


systemd-analyze blame 

# 
systemd-analyze plot --help    
systemd-analyze plot > ./graph1.svg  
xdg-open ./graph1.svg 
```

## Controlling Server

```sh
systemctl reboot -i  

loginctl   
```

# Resources

* `cheatsheet systemd` 
* `cheatsheet systemctl` 
* Systemd Units Explained with Types and States [here](https://www.computernetworkingnotes.com/linux-tutorials/systemd-units-explained-with-types-and-states.html)
* How To Use Systemctl to Manage Systemd Services and Units [here](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)
* Understanding and administering systemd [here](https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html#_unit_parameters)
* More Systemd Fun: The Blame Game And Stopping Services With Prejudice [help](https://www.linux.com/training-tutorials/more-systemd-fun-blame-game-and-stopping-services-prejudice/)
* Use systemd timers instead of cronjobs [here](https://opensource.com/article/20/7/systemd-timers)
