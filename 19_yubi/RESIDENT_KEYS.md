# RESIDENT KEYS

NOTES:

* Requires brews OpenSSL as Apple compile with --disable-security-key
* Resident Keys are Passkeys
* Resident Keys are generated on the yubikey and therefore you will have a unique key per yubikey.  

## Generate

```sh
# OpenSSH_8.6p1, LibreSSL 3.3.6
ssh -V 

# openssh needs to be installed from brew
ssh-keygen --help  

export PATH=$(brew --prefix openssh)/bin:$PATH
ssh-keygen --help  

# clean out the key
ykman fido reset

# pins
ykman fido access change-pin --new-pin 654321

mkdir -p ./ssh_server/resident-keys

# no touch
ssh-keygen -f ./ssh_server/resident-keys/id_ed25519-sk-notouch -t ed25519-sk -O application=ssh:no-touch-personal -O no-touch-required -O resident

# list keys
ykman fido credentials list --pin 654321

# download keys from fido into current directory 
ssh-keygen -K
```

## SSH

```sh
ssh -i ./id_ed25519_sk_rk_no-touch-personal -vvvv -o StrictHostKeyChecking=no -o IdentitiesOnly=yes -p 2822 root@0.0.0.0
```

## Gitea

Goto Gitea [git-server/README.md](./git-server/README.md)  

```sh
# connect to gitea server
ssh -i ./id_ed25519_sk_rk_no-touch-personal -p 222 git@localhost
```

## Github

```sh
# override the ssh command to use the yubi resident key
export GIT_SSH_COMMAND="ssh -i $(pwd)/ssh_server/resident-keys/id_ed25519_sk_rk_no-touch-personal" 
git remote show origin 
```

## Troubleshooting

It seems that if you're having trouble logging in then kill `ssh-agent` and try again.  

```sh
# 
ssh-add -D

ps -ax | grep ssh-agent
kill [id]
```

## Resources

* Using YubiKey resident keys for Git and SSH on macOS [here](https://dev.to/tw3n/using-yubikey-resident-keys-for-git-and-ssh-on-macos-48j7)  
* Having difficulty to get SSH with a Yubikey working with macOS monterey [here](https://stackoverflow.com/questions/68573454/having-difficulty-to-get-ssh-with-a-yubikey-working-with-macos-monterey)  
* Using SSH Resident Keys With a YubiKey 5 [here](https://ilanjoselevich.com/blog/using-ssh-resident-keys-with-a-yubikey-5/)
* Discoverable Credentials / Resident Keys [here](https://developers.yubico.com/WebAuthn/WebAuthn_Developer_Guide/Resident_Keys.html)
* WebAuthn Resident Key: Discoverable Credentials as Passkeys [here](https://www.corbado.com/blog/webauthn-resident-key-discoverable-credentials-passkeys)
* Passkeys vs. 2FA: Why Passkeys are More Secure than Regular 2FA [here](https://www.corbado.com/blog/passkeys-vs-2fa-security)
* Yubico’s Take on U2F Key Wrapping [here](https://www.yubico.com/blog/yubicos-u2f-key-wrapping/)

* Use same ed25519-sk key with two different Yubikeys [here](https://www.reddit.com/r/yubikey/comments/pkey1j/use_same_ed25519sk_key_with_two_different_yubikeys/)
* Gitlab: Show how to configure git for key [here](https://docs.gitlab.com/ee/user/ssh.html)
* Show HN: Yubikey-agent – an easy to use Go ssh-agent for YubiKeys [here](https://news.ycombinator.com/item?id=23131979)
