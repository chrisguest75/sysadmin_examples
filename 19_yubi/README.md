# README

Demonstrate how to use `yubikey`.

## Reason

Yubikey offers a lot of support for different auth protocols and certificates.  

TERMINOLOGY:

- FIDO2 - Fast Identity Online (FIDO) [fidoalliance.org](https://fidoalliance.org/fido2/)
- OTP - [One-time password](https://en.wikipedia.org/wiki/One-time_password)
- PIV - Personal Identity Verification - [What is PIV?](https://developers.yubico.com/PIV/)
- WebAuthn - [WebAuthn Introduction](https://developers.yubico.com/WebAuthn)
- PKCS - Public Key Cryptography Standards [PKCS](https://en.wikipedia.org/wiki/PKCS)

## Check genuine Yubikey

Verify your Yubikey [here](https://www.yubico.com/genuine/)  

## Tools

Details about the tools [here](https://developers.yubico.com/PIV/Tools.html)  

* ykman - Configure your YubiKey via the command line (this is replacement for yubico-piv-tool).
* yubico-piv-tool - Tool for managing Personal Identity Verification credentials on Yubikeys
* gpg - OpenPGP encryption and signing tool
* yubikey manager ui - [here](https://www.yubico.com/support/download/yubikey-manager/)  

```sh
brew info ykman 
brew info yubico-piv-tool
brew info yubico-yubikey-manager 
brew info openssh  

# install them
brew install ykman
brew install yubico-piv-tool
brew install yubico-yubikey-manager       
brew install openssh       

# NOTE: Apparently this is not required anymore
brew install opensc       

# time of writing - YubiKey Manager (ykman) version: 5.0.0
# time of writing - YubiKey Manager (ykman) version: 5.4.0
ykman --version
# time of writing - yubico-piv-tool 2.3.0
# time of writing - yubico-piv-tool 2.4.2
yubico-piv-tool --version

# time of writing - gpg (GnuPG) 2.4.5
gpg --version

# OpenSSH_9.7p1, OpenSSL 3.2.1 30 Jan 2024
$(brew --prefix openssh)/bin/ssh -V 

# list devices
ykman list   

# list details
ykman info

# gpg can show details on the card
gpg --card-status

# show slots
yubico-piv-tool -a status
```

Go get the GUI manager from [website](https://www.yubico.com/support/download/yubikey-manager/)  

## Resetting PIN & PUK

Accessing administrative functions. Containing list of operations [here](https://developers.yubico.com/PIV/Introduction/Admin_access.html)  

* PIN (Personal Identification Number)
* PUK (PIN Unblocking Key)

The default PIN code is `123456`. The default PUK code is `12345678`.  

The default 3DES management key (9B) is `010203040506070801020304050607080102030405060708`.  

Technical details about the YubiKey PIV implementation can be found [here](https://developers.yubico.com/PIV/Introduction/YubiKey_and_PIV.html)  

Change the pins PIN and PUK  

```sh
# reset key
ykman piv reset
ykman fido reset

# generate random key
key=`dd if=/dev/random bs=1 count=24 2>/dev/null | hexdump -v -e '/1 "%02X"'`
echo $key
yubico-piv-tool -a set-mgm-key -n $key --key 010203040506070801020304050607080102030405060708

# pins
yubico-piv-tool -a change-pin -P 123456 -N 123456   
yubico-piv-tool -a change-puk -P 12345678 -N 12345678

# or new tool
ykman piv access change-pin --pin 123456 --new-pin 654321
ykman piv access change-puk --pin 12345678 --new-pin 87654321
ykman fido access change-pin --new-pin 654321
```

## Prereqs

```sh
sudo apt install -y curl gnupg2 gnupg-agent cryptsetup scdaemon pcscd
```

```sh
lsusb -v 2> /dev/null | grep -A4 -B 5 -i yubi  
```

## Resources

- Ultimate Yubikey Setup Guide with ed25519! [here](https://zach.codes/ultimate-yubikey-setup-guide/)
- YubiKey Manager - Cross-platform application for configuring any YubiKey over all USB interfaces. [here](https://www.yubico.com/support/download)
- Developer Program [here](https://developers.yubico.com/)
- FIDO Alliance [here](https://fidoalliance.org/fido2/)
- Yubico OTPs Explained [here](https://developers.yubico.com/OTP/OTPs_Explained.html)
* Yubikey Certificate Attestation Improved [here](https://www.securew2.com/blog/yubikey-certificate-attestation/)
* YubiKey SSH on MacOS [here](https://chewing-the-code.blogspot.com/2019/05/yubikey-ssh-onmacos.html)
* Yubikey provisioning scripts [here](https://github.com/santiago-mooser/yubikey-provisioning-scripts)
* Do I need a master key to get SSH PIV working? https://developers.yubico.com/PGP/
* Yubikey Handbook [here](https://ruimarinho.gitbooks.io/yubikey-handbook/content/)
* Yubikey as an SSH key [here](https://github.com/jamesog/yubikey-ssh)  

### Guides

* https://github.com/drduh/YubiKey-Guide
* https://github.com/santiago-mooser/yubikey-provisioning-scripts