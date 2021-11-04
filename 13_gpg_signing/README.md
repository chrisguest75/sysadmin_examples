# README
Signing verified commits with gpg

TODO:
* s/MIME
* smimesign
* Codespaces 
* Web commits
* multiple machines
* Has the key been published publically? 

## Install gpg
Instal gpg tooling
```sh
brew install gpg            
gpg --version       

# compare to latest
open https://www.gnupg.org/download/
```

## Create gpg key and set on github
Create the gpg locally [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key)

```sh
# check if you have a key already
gpg --list-secret-keys --keyid-format=long  

# generate a key - use noreply chrisguest75@users.noreply.github.com
# enter a passphrase
gpg --default-new-key-algo rsa4096 --gen-key

# see generated keys
gpg --list-secret-keys --keyid-format=long  

# export the key in armor format to be imported into github
gpg --armor --export XXXXXXXXXXXXXXXX
```

Copy the key to GPG keys.  It seems you cannot name them in github.  


## Configure git (smime)
Unsure if smime is required. 
https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key

```sh
git --version 

https://github.com/github/smimesign

brew install smimesign   

git config --local --list        

git config --local gpg.x509.program smimesign  
git config --local gpg.format x509             
git config --local user.email chrisguest75@users.noreply.github.com  

git config --get user.email    
smimesign --list-keys   
```






# Resources 
https://juliansimioni.com/blog/troubleshooting-gpg-git-commit-signing/

https://thecesrom.dev/2021/01/27/troubleshooting-gpg-signed-commits-on-macos/


https://www.gnupg.org/download/

https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification


