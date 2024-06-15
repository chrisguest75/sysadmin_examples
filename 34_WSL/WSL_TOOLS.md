# WSL TOOLS

Using tools like `gh` cli you'll find that simple commands that open browsers won't work because it will attempt to use `xdg-open`.  Installing `wslu` will offer a command `wslview` that makes it work. 

```sh
sudo add-apt-repository ppa:wslutilities/wslu
sudo apt update

apt search wslu
sudo apt install wslu

gh repo view --web
```

## Resources

* wslutilities/wslu [repo](https://github.com/wslutilities/wslu)
* wslu Wiki [here](https://wslutiliti.es/wslu/install.html)
* Open browser in host system from Windows Subsystem for Linux? [here](https://superuser.com/questions/1262977/open-browser-in-host-system-from-windows-subsystem-for-linux)  
