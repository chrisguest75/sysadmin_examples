# README

TODO:

- signing versus encryption versus authentication
- create a master key on yubikey



## Taxonomy

- DSA - Digital Signature Algorithm. It should not be used anymore.  
- RSA - Rivest–Shamir–Adleman
- ECDSA - Elliptic Curve Digital Signature Algorithm
- ED25519 - Edwards-Curve Digital Signature Algorithm (EdDSA)
- ELG-E - ElGamal encryption system
- eccp256 - 256bit curve
- eccp384 - 384bit curve
- PEM - (Privacy Enhanced Mail”) "-----BEGIN CERTIFICATE-----"
- DER (Distinguished Encoding Rules) - Binary Format
- PKCS - Public-Key Cryptography Standards
- PKCS#11 - Cryptographic Token Interface Standard - defines a platform-independent API to cryptographic tokens
- PKCS#12 -  defines an archive file format for storing many cryptography objects as a single file.  
- GPG - GNU Privacy Guard
- TOFU - Trust On First Use anti-pattern

## Generate

```sh
mkdir -p ./keys
ssh-keygen -o -a 100 -t ed25519 -f ./keys/id_ed25519 
ssh-keygen -o -a 100 -t rsa -f ./keys/id_rsa 
```

## Decode

```sh
openssl asn1parse -in ./keys/id_ed25519
/usr/local/Cellar/openssl@3/3.0.5/bin/openssl asn1parse -strictpem -in ./keys/id_ed25519 --help
```

## Alice

Build and run the container

```sh
# Build 
docker build -t alice -f Dockerfile.alice .

# run alice
docker run -it --entrypoint /bin/sh alice
```

```sh
# Batch it instead of `gpg --full-generate-key`
# NOTE: passphrase
cat >key-settings <<EOF
     %echo Generating a basic OpenPGP key
     Key-Type: DSA
     Key-Length: 1024
     Subkey-Type: ELG-E
     Subkey-Length: 1024
     Name-Real: Alice
     Name-Comment: no-comment
     Name-Email: alice@alice.com
     Expire-Date: 1
     Passphrase: alice
     %commit
     %echo done
EOF

gpg --batch --generate-key key-settings
```

```sh
# Print out the key
gpg --export --armor alice@alice.com
```

https://zach.codes/ultimate-yubikey-setup-guide/

gpg --expert --full-gen-key

gpg --expert --edit-key D16BDB0DF05845D6F36AF33506D08A272977452F

addkey

   (S) Toggle the sign capability
   (E) Toggle the encrypt capability
   (A) Toggle the authenticate capability



## Resources


https://blog.programster.org/gpg-subkeys


https://blog.programster.org/generating-gpg-master-and-subkeys

https://www.reddit.com/r/yubikey/comments/f77731/storing_gpg_master_key_on_a_separate_yubikey/

https://support.yubico.com/hc/en-us/articles/360013790259-Using-Your-YubiKey-with-OpenPGP#Generating_Keys_externally_from_the_YubiKey_(Recommended)ui6vup



https://wiki.debian.org/Subkeys

https://www.esev.com/blog/post/2015-01-pgp-ssh-key-on-yubikey-neo/

- Edwards-Curve Digital Signature Algorithm (EdDSA) [here](https://datatracker.ietf.org/doc/html/rfc8032)  
- Elliptic curve P-384 [here](https://www.johndcook.com/blog/2019/05/11/elliptic-curve-p-384/)
- ElGamal encryption [here](https://en.wikipedia.org/wiki/ElGamal_encryption)
- PEM, DER, CRT, and CER: X.509 Encodings and Conversions [here](https://www.ssl.com/guide/pem-der-crt-and-cer-x-509-encodings-and-conversions/) 
- PKCS#11: Cryptographic Token Interface Standard [here](https://www.cryptsoft.com/pkcs11doc/)  
