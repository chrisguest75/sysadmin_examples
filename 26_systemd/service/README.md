# README

Install a basic systemd service  

TODO:

* Add an apt installer with manpage.  

## Configure

```sh
# generate config from shell variables $USER and $PWD
cat ./chrisguest75webservice.service.template | envsubst > ./chrisguest75webservice.service 
```

## Install

```sh
# install the service
sudo ln -s $(pwd)/chrisguest75webservice.service /etc/systemd/system/chrisguest75webservice.service  

# Start the service
sudo systemctl start chrisguest75webservice 

# show environment
sudo systemctl show --property=Environment chrisguest75webservice

systemctl status chrisguest75webservice 
```

## Test 

```sh
# test the webservice
curl -vvvv localhost:8081/clientpath  
# stop service
sudo systemctl stop chrisguest75webservice 
# test should fail
curl -vvvv localhost:8081/clientpath  
# start service
sudo systemctl start chrisguest75webservice
# logs for service
journalctl -b -u chrisguest75webservice.service --no-pager
```

## Remove

```sh
# stop the service
systemctl stop chrisguest75webservice 
```

```sh
# remove the service
sudo rm /etc/systemd/system/chrisguest75webservice.service  
```

## Resources

* [systemd wiki](https://www.freedesktop.org/wiki/Software/systemd/)  
