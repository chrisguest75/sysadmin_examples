# README
Signing commits with gpg

STATUS:
* Code/Scratch/sysadmin_examples is locally configured to use s/mime
* Not sure if I need to do this.  
* Need to reset local config `git config --local --list`  


TODO:
* s/MIME
* smimesign
* Codespaces 
* Web commits
* multiple machines

## Install gpg
```sh
brew install gpg            
gpg --version       

# compare to latest
open https://www.gnupg.org/download/
```


## Create gpg key and set on github
```sh
gpg --list-secret-keys --keyid-format=long  

Generating a key
https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key

gpg --default-new-key-algo rsa4096 --gen-key

Use noreply
chrisguest75@users.noreply.github.com

Enter passphrase


gpg --armor --export XXXXXXXXXXXXXXXX
```

Copy the key to GPG keys.  It seems you cannot name them in github.  

Has the key been published? 


https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key

## Configure git
Unsure if smime is required. 
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


https://www.gnupg.org/download/

https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification


