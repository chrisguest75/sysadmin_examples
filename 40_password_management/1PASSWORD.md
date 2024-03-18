# 1PASSWORD

Demonstrate how to use 1Password.  

## Install

### Windows

```powershell
# in an admin shell
choco install 1password
choco install op
```

#### WSL

```sh

```

### MacOS

```sh
brew info 1password-cli

brew install 1password-cli
```

## Using CLI

### Powershell

```powershell
# this allows an integrated signin from desktop app now. 
op signin myaccount.1password.com my.them@email.com

# each request has to be authorised by windows hello
op item list | select-string -pattern "mykey"

op item get sbxxxx36txxxxxxxap5paf6qlm --fields label=username,label=password
```

### Shell

```sh
op signin trint.1password.com my.email@domain.com

eval $(op signin trint)

op item get sbxxxx36txxxxxxxap5paf6qlm --fields label=username,label=password
```

## Resources

* https://formulae.brew.sh/cask/1password-cli
* https://support.1password.com/command-line/

