# WSL

Follow the attach and bind instructions for [34_WSL/WSL_USB.md](../34_WSL/WSL_USB.md)  

## Share key into WSL

```powershell
usbipd list
usbipd bind --busid 2-1
usbipd attach --wsl --busid 2-1
```

## Access key

```sh
# install pcscd (smart card daemon)
sudo apt-get install pcscd
sudo service pcscd start

ykman list
```

## Resources

* Windows software for sharing locally connected USB devices to other machines, including Hyper-V guests and WSL 2. [here](https://github.com/dorssel/usbipd-win)  
