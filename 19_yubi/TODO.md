TODO:




openssl asn1parse -in ./ssh_server/keys/id_rsa 
openssl asn1parse -in ./ssh_server/keys/id_ed25519   
openssl asn1parse -in ./ssh_server/resident-keys/id_ed25519-sk


ssh-keygen -D $(realpath /usr/local/lib/libykcs11.dylib) -e 




* Generate an SSH certificate
* Upload a RSA4096 key onto yubikey
* Upload a ED25519 key onto yubikey




- working on wsl
- git commit
- git signing
- associate to github
- signing a text file
- subkeys
- docker build attestation
- Check out the attestation.
- Using kms as a root key
- titan keys? https://support.google.com/titansecuritykey/answer/9148044?hl=en-GB
- https://github.com/ixydo/gpg-smartcard-automation
- Yubikey provisioning https://github.com/santiago-mooser/yubikey-provisioning-scripts

* How to Store an SSH Key on a Yubikey  https://news.ycombinator.com/item?id=31556130

Add support for security key/FIDO2-based ssh keys https://gitlab.com/gitlab-org/gitlab/-/issues/213259

Security keys are now supported for SSH Git operations https://github.blog/2021-05-10-security-keys-supported-ssh-git-operations/


ECDSA: The digital signature algorithm of a better internet https://blog.cloudflare.com/ecdsa-the-digital-signature-algorithm-of-a-better-internet


How secure is ed25519 compared to ecdsa or rsa for ssh keys? https://www.reddit.com/r/sysadmin/comments/hemawt/how_secure_is_ed25519_compared_to_ecdsa_or_rsa/



https://blog.fraggod.net/2015/09/04/parsing-openssh-ed25519-keys-for-fun-and-profit.html




