# WSL USB

Demonstrate how to share USB devices into WSL.  

## Install

```powershell
winget install usbipd
```

## Configuring

As a quick test use the webcam.  

```powershell
# list devices
usbipd list

# requires admin
usbipd bind --busid 1-12

# it should be shared now
usbipd list

# attach to wsl
usbipd attach --wsl --busid 1-12
```

## Test

Inside WSL.  

```sh
# the device should be listed
lsusb

# is the USB device registering?
dmesg

# video 4 linux (requires kernel support for media)
apt info v4l-utils
sudo apt install v4l-utils
sudo v4l2-ctl --list-devices
```

## Detach

```sh
# detach and unbind
usbipd detach -b 1-12
usbipd unbind -b 1-12

# should be not-shared
usbipd list
```

## Resources

* Connect USB devices [here](https://learn.microsoft.com/en-us/windows/wsl/connect-usb)  
* dorssel/usbipd-win repo [here](https://github.com/dorssel/usbipd-win)
* usbipd-win WSL support [here](https://github.com/dorssel/usbipd-win/wiki/WSL-support)  
