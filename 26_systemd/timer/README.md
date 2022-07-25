# README

Install a basic systemd timer trigger.  

## Example

```sh
CAPTURE_PATH=$(pwd)/captures ./capture-photo.sh  
```
## Install Service

```sh
# generate config from shell variables $USER and $PWD
cat ./chrisguest75capturephoto.service.template | envsubst > ./chrisguest75capturephoto.service 

# install the service
sudo ln -s $(pwd)/chrisguest75capturephoto.service /etc/systemd/system/chrisguest75capturephoto.service  

# Start the service
sudo systemctl start chrisguest75capturephoto 

systemctl status chrisguest75capturephoto 

systemctl cat chrisguest75capturephoto.service   
```

## Install Timer

```sh
# generate config from shell variables $USER and $PWD
cat ./chrisguest75capturephototimer.timer.template | envsubst > ./chrisguest75capturephototimer.timer 

# install the service
sudo ln -s $(pwd)/chrisguest75capturephototimer.timer /etc/systemd/system/chrisguest75capturephototimer.timer

# Start the timer
sudo systemctl start chrisguest75capturephototimer
sudo systemctl enable chrisguest75capturephototimer.timer
# if it doesn't work use enable --now 
sudo systemctl enable --now chrisguest75capturephototimer.timer 

systemctl status chrisguest75capturephototimer 

systemctl cat chrisguest75capturephototimer.timer  
```

## Troubleshooting

```sh
# logs for service
journalctl -b -u chrisguest75capturephoto.service --no-pager
journalctl -b -u chrisguest75capturephototimer.timer --no-pager
```


## Remove

```sh
# stop the service
systemctl stop chrisguest75capturephoto 
systemctl disable chrisguest75capturephototimer.timer 
systemctl --user stop chrisguest75capturephototimer.timer    

# if a timer is failing to be removed "not-found"
systemctl reset-failed   
```

```sh
# remove the service
sudo rm /etc/systemd/system/chrisguest75capturephoto.service  
```

## Resources

* Run script every 30 min with systemd [here](https://unix.stackexchange.com/questions/198444/run-script-every-30-min-with-systemd)
* How to set environment variable in systemd service? [here](https://serverfault.com/questions/413397/how-to-set-environment-variable-in-systemd-service)
* Systemd timers onCalendar (cron) format explained [here](https://silentlad.com/systemd-timers-oncalendar-(cron)-format-explained)  
