# WIFI DRIVER

Demonstrate how to get USB wifi driver on Ubuntu 22.04.3 LTS.

## Source

```sh
git clone https://github.com/cilynx/rtl88x2bu

# build it
make clean
make
# install it
sudo make install
# shutdown
shutdown now -r
# check installed 
lsmod | sort
lspci
```

## Power saving

```sh
# get the device id of the wifi adapter
ip addr

# get current status of wifi adapter
iw dev wlx1cbfcec13467 get power_save

# turn off power saving
iw dev wlx1cbfcec13467 set power_save off
```

## Resources

* cilynx/rtl88x2bu repo [here](https://github.com/cilynx/rtl88x2bu)
* How to keep USB WiFi adapter from turning off/sleeping in Kali Linux VM? [here](https://superuser.com/questions/1333990/how-to-keep-usb-wifi-adapter-from-turning-off-sleeping-in-kali-linux-vm)
