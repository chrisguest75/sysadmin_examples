# RESIDENT KEYS

NOTES:

* Requires brews OpenSSL as Apple compile with --disable-security-key

TODO:

* THIS IS NOT WORKING

```sh
# OpenSSH_8.6p1, LibreSSL 3.3.6
ssh -V 

# openssh needs to be installed from brew
ssh-keygen --help  

export PATH=$(brew --prefix openssh)/bin:$PATH
ssh-keygen --help  

ykman piv access change-pin  

mkdir -p ./ssh_server/resident-keys
ssh-keygen -f ./ssh_server/resident-keys/id_ed25519-sk -t ed25519-sk -O application=ssh:personal -O no-touch-required -O resident

# both not working correctly
ykman fido credentials list --pin 654321            
ssh-keygen -K

ssh-keygen -D $(realpath /usr/local/lib/libykcs11.dylib) -e 

ssh -f ./ssh_server/residentkeys/id_ed25519-sk -vvvv -o StrictHostKeyChecking=no -o IdentitiesOnly=yes -p 2822 root@0.0.0.0
```

## Resources

* Using YubiKey resident keys for Git and SSH on macOS [here](https://dev.to/tw3n/using-yubikey-resident-keys-for-git-and-ssh-on-macos-48j7)  
* Having difficulty to get SSH with a Yubikey working with macOS monterey [here](https://stackoverflow.com/questions/68573454/having-difficulty-to-get-ssh-with-a-yubikey-working-with-macos-monterey)  
https://ilanjoselevich.com/blog/using-ssh-resident-keys-with-a-yubikey-5/
https://developers.yubico.com/WebAuthn/WebAuthn_Developer_Guide/Resident_Keys.html
https://www.corbado.com/blog/webauthn-resident-key-discoverable-credentials-passkeys
https://www.corbado.com/blog/webauthn-resident-key-discoverable-credentials-passkeys#introduction
https://www.corbado.com/blog/passkeys-vs-2fa-security