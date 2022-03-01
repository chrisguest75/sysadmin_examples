# README

Demonstrate how to use `yubikey` on linux.

TODO:

* titan keys?
* https://github.com/ixydo/gpg-smartcard-automation


## Prereqs 
```sh
sudo apt install -y curl gnupg2 gnupg-agent cryptsetup scdaemon pcscd
```

```sh
lsusb -v 2> /dev/null | grep -A4 -B 5 -i yubi  
```


## Resources

* https://developers.yubico.com/