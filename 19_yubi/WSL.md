# WSL

Follow the attach and bind instructions for [34_WSL/WSL_USB.md](../34_WSL/WSL_USB.md)  

NOTES:

* You can use the windows cli tool (but you have to have entered the WSL from a powershell admin prompt)

## Tools

Choco does not seem to have latest yubikey-manager goto [github] (https://github.com/Yubico/yubikey-manager/releases/tag/5.4.0) instead.

## Share key into WSL

```powershell
# find
usbipd list
# share
usbipd bind --busid 2-1
# attach
usbipd attach --wsl --busid 2-1
```

## Access key

```sh
# install pcscd (smart card daemon)
sudo apt-get install pcscd
sudo service pcscd start
sudo service pcscd restart

# show usb devices
lsusb

# will show a key
ykman list

# NOT WORKING
ykman fido info
```

## Detach

```sh
# detach and unbind
usbipd detach -b 2-1
usbipd unbind -b 2-1

# should be not-shared
usbipd list
```

## Troubleshooting

```sh
ykman info
ykman --diagnose

ykman fido info

# use windows cli app (you have to have detached the usb device though and enter wsl from powershell admin prompt)
/mnt/c/Program\ Files/Yubico/YubiKey\ Manager\ CLI/ykman.exe fido credentials list
```


## Resources

* Windows software for sharing locally connected USB devices to other machines, including Hyper-V guests and WSL 2. [here](https://github.com/dorssel/usbipd-win)  
* https://github.com/Yubico/yubikey-manager/issues/558
* https://superuser.com/questions/1708979/why-yubikey-usb-key-needs-administrator-rights-or-any-other-device