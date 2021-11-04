# README
Signing commits with gpg

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


## 
gpg --list-secret-keys --keyid-format=long  

Generating a key
https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key

gpg --default-new-key-algo rsa4096 --gen-key

Use noreply
chrisguest75@users.noreply.github.com

Enter passphrase


gpg --armor --export XXXXXXXXXXXXXXXX


Copy the key to GPG keys.  It seems you cannot name them.  

Has the key been published? 


https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key


https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key









https://www.gnupg.org/download/

https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification


