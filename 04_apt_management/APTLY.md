# APTLY

TODO:

* Docker
* Nix
* Build repository and install packages from it.

## Install

```sh
nix-shell -p aptly -p gnupg
```

## Docker

```sh
just -f justfile.aptly aptly-exec

open http://127.0.0.1:8080/

/opt/keys_imp.sh
/opt/update_mirror.sh
```


## Steps

```sh
gpg --gen-key

Real name: Repository
Email address: repo@test.com

Okay

gpg --no-default-keyring --keyring trustedkeys.gpg --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C

gpg --list-keys

aptly mirror create -gpg-provider="gpg2" -keyring=trustdb.gpg -architectures=amd64 -filter='Priority (required) | Priority (important) | Priority (standard)' ubuntu-noble http://www.mirrorservice.org/sites/archive.ubuntu.com/ubuntu/ noble main


```

## Resources

* Swiss army knife for Debian repository management [here](https://www.aptly.info/)
* https://github.com/aptly-dev/aptly
* https://www.aptly.info/tutorial/
* https://cloud.theodo.com/en/blog/debian-mirrors-aptly
* https://github.com/aptly-dev/docker-aptly