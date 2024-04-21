# PASSKEYS

Passkeys are more secure as passwords do not get sent to external services.

NOTES:

* They are hard to phish as you still need access to the physical key
* No passwords leave the device. The pin is only using to unlock the private key.  
* You shold really register multiple passkeys.
* They are not only yubikeys; iOS, Android, 1Password, etc all have versions. 

## Process

* Add key to account
* Login
* Type in your pin when challenged
* Press the yubikey

## Github

You can register a security key and promote it to a passkey.

This gets added as a FIDO resident key and takes a slot.  

```sh
nix-shell -p yubikey-manager

# list keys
ykman fido credentials list --pin 654321
```

## Tested (on github.com)

* NixOS with Firefox (gnome browser did not support them)
* MacOS with Chrome
* Android with Chrome
* iOS with Safari

## Resources

* https://www.passkeys.io/
* https://passkeys.dev/
* https://github.com/passwordless-id/webauthn?tab=readme-ov-file