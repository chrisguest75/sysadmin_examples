# UBUNTU

Notes for `ubuntu` installs and troubleshooting.  

## BOOT FAILURE

* Hold down `esc` during boot to enter recoverymode.  
* Update packages and drivers.  

## WIFI DRIVER

Build the USB wifi driver [37_wifi/README.md](../37_wifi/README.md).  

## MISSING "libcrypto.so.1.1"

Met this problem whilst trying to run some unittests for [MongoInMemoryStore](https://www.mongodb.com/docs/manual/core/inmemory/).  

```sh
dpkg --print-architecture

mkdir -p ./out

# download
curl -o ./out/libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb  http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb     

# look at contents
dpkg -c ./out/libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb

# install
sudo dpkg -i ./out/libssl1.1_1.1.1f-1ubuntu2.22_amd64.deb
```

## VLC failing to run

Not sure how VLC can't work this out. But it will segfault if the fontcache is broken.  

```sh
sudo rm /var/cache/fontconfig/*
rm ~/.cache/fontconfig/*
fc-cache -r
```

## Resources

* LibSSL debian packages [here](http://security.ubuntu.com/ubuntu/pool/main/o/openssl/)
* Installing the libssl1.1 shared objects [here](https://askubuntu.com/questions/1403837/how-do-i-use-openssl-1-1-1-in-ubuntu-22-04)
