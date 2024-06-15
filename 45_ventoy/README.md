# VENTOY

Create a bootable USB with selectable ISOs.  

It's useful for hosting a USB key with:

* GParted [here](https://gparted.org/)
* Clonezilla [here](https://clonezilla.org)
* Windows ISO
* Ubuntu ISO

## Ventoy Web (NixOS)

Create the USB and copy ISOs into the root.  

```sh
nix-shell -p ventoy-full
sudo ventoy-web


xdg-open http://127.0.0.1:24680/

# list root of usb on ni
ll /run/media/chrisguest/Ventoy
```

## Resources

* Setup Ventoy on NixOs [here](https://haseebmajid.dev/posts/2023-09-29-setup-ventoy-on-nixos/)