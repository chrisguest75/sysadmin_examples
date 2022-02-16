# README

Demonstrate how to use Mozilla SOPS.  

## Install sops

```sh
brew install sops

# show version
sops -v  
```

## Install gpg

Instal gpg tooling

```sh
brew install gpg            
gpg --version       

# compare to latest
open https://www.gnupg.org/download/
```

## Create gpg key

Create the gpg locally [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

```sh
# check if you have a key already
gpg --list-secret-keys --keyid-format=long  

# generate a key - use noreply chrisguest75@users.noreply.github.com
# enter a passphrase
gpg --full-generate-key         
# for older versions
gpg --default-new-key-algo rsa4096 --gen-key

# answers
> (1) RSA and RSA
> What keysize do you want? (3072) 4096
> Real name: SOPS Test
> Email address: sops@guestcode.dev
> Comment: Testing SOPS
> You selected this USER-ID:
>    "SOPS Test (Testing SOPS) <sops@guestcode.dev>"
> password: testsops

# see generated keys
gpg --list-secret-keys --keyid-format=long  

# export the key in armor format
gpg --armor --export XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

## Encryption

```sh
# set key thumbprint
export SOPS_PGP_FP="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 

# encrypt
sops -e ./my_secrets.json  
sops -e ./my_secrets.json > ./my_secrets.enc.json    
```

## Decryption

```sh
# if you have a password on the pgp key
gpg-agent
GPG_TTY=$(tty)                                     
export GPG_TTY

# now decrypt
sops -d ./my_secrets.enc.json  
```

## Clean keys

```sh
unset SOPS_PGP_FP 
gpg --delete-secret-keys "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" 
```

## Resources

* SOPS: Secrets OPerationS [here](https://github.com/mozilla/sops)
* PGP and SOPS Gist [here](https://gist.github.com/twolfson/01d515258eef8bdbda4f)
* gpg.mozilla.org service has ended [here](https://gpg.mozilla.org/)
* GPG 4.3 Configuration files [here](https://www.gnupg.org/documentation/manuals/gnupg/GPG-Configuration.html)
* Public keyserver keys.openpgp.org [here](https://keys.openpgp.org/)
* Cannot decrypt with GPG 2.2.5 and SOPS 3.0.0 [here](https://github.com/mozilla/sops/issues/304) 