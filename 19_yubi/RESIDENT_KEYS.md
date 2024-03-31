# RESIDENT KEYS

NOTES:

* Requires brews OpenSSL as Apple compile with --disable-security-key

```sh
# OpenSSH_8.6p1, LibreSSL 3.3.6
ssh -V 

export PATH=$(brew --prefix openssh)/bin:$PATH

# openssh needs to be installed from brew
ssh-keygen --help  
$(brew --prefix openssh)/bin/ssh-keygen --help  

mkdir -p ./ssh_server/residentkeys
$(brew --prefix openssh)/bin/ssh-keygen -f ./ssh_server/residentkeys/id_ed25519-sk -t ed25519-sk -O application=ssh:personal -O no-touch-required -O resident



$(brew --prefix openssh)/bin/ssh-add -K

$(brew --prefix openssh)/bin/ssh -f ./ssh_server/residentkeys/id_ed25519-sk -vvvv -o StrictHostKeyChecking=no -o IdentitiesOnly=yes -p 2822 root@0.0.0.0
```

## Resources

* https://dev.to/tw3n/using-yubikey-resident-keys-for-git-and-ssh-on-macos-48j7
* https://stackoverflow.com/questions/68573454/having-difficulty-to-get-ssh-with-a-yubikey-working-with-macos-monterey