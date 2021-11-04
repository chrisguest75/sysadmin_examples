# README
Signing verified commits with gpg

TODO:
* s/MIME
* smimesign
* Codespaces 
* Web commits
* Multiple machines
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

Copy the key to GPG keys.  
Unfortunately it seems you cannot name the keys in github.  

## Configure git 
```sh
# set noreply email
git config --local user.email=chrisguest75@users.noreply.github.com

# copy signing key into config 
gpg --list-secret-keys --keyid-format=long  
git config --local user.signingkey XXXXXXXXXXXXXXXX 
    
# apparently the tty has to be set (should be added to profile)
export GPG_TTY=$(tty)        

# Add files, commit and push.  
git add .
git commit -S -m "Add some files" 
git push 
```

Automatic signing 
```sh
git config --local commit.gpgsign true    
```


## Configure vscode
Follow the instructions [here](https://dev.to/devmount/signed-git-commits-in-vs-code-36do)

In `settings.json`
```json
{
    "git.enableCommitSigning": true
}
```

## Git checking 
```sh
# show signatures on commits 
git log --show-signature -n 10
```



# Resources 
* [troubleshooting-gpg-git-commit-signing](https://juliansimioni.com/blog/troubleshooting-gpg-git-commit-signing/)
* [troubleshooting-gpg-signed-commits-on-macos](https://thecesrom.dev/2021/01/27/troubleshooting-gpg-signed-commits-on-macos/)
* [sign-git-commits-on-github-with-gpg-in-macos](https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/)

