# MIRRORS

TODO:

* arm and x86

NOTES:

* There are many regional package mirrors.  
* There seem to be issues when installing `curl` from https mirror.  

## Build

```sh
# run the image
just docker-run ubuntu

# look at source config
cat /etc/apt/sources.list.d/*
cat /etc/apt/sources.list
```

## Resources

* Mirrors [ubuntu wiki](https://wiki.ubuntu.com/Mirrors)
* Official Archive Mirrors for Ubuntu [here](https://launchpad.net/ubuntu/+archivemirrors)
* Explanation of the DEB822 Source Format [here](https://repolib.readthedocs.io/en/latest/deb822-format.html)
https://askubuntu.com/questions/146108/how-to-use-https-with-apt-get
* https://linuxsimply.com/linux-basics/package-management/repository-configuration/ubuntu-repository-mirror/