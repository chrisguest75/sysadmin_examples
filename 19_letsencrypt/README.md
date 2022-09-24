# README

Demonstrate using `letsencrypt` to generate a certificate  

Based on an example [40_ssl_nginx](https://github.com/chrisguest75/docker_build_examples/tree/master/40_ssl_nginx)  

TODO:  

* Check the expiry of the PEM files.
* Renew the certs?  
* Overlapping certs?  
* Prevent it being issued by adding a CAA record.

## Prerequsites

Lets encrypt steps based on the instructions [here](https://certbot.eff.org/instructions?ws=other&os=osx)  


```sh
# install certbot
brew install certbot
```

## Create certificate for letsencrypt.local.guestcode.uk

```sh
# configure to get a secret (run to renew)
certbot certonly --config-dir ./certbot/config --logs-dir ./certbot/logs --work-dir ./certbot/work --manual --preferred-challenges dns --register-unsafely-without-email -d letsencrypt.local.guestcode.uk

# add the value to your personal DNS
# once modified use dig or googletools
dig TXT _acme-challenge.letsencrypt.local.guestcode.uk

open https://toolbox.googleapps.com/apps/dig/#TXT/_acme-challenge.letsencrypt.local.guestcode.uk
```

## Modify hosts

```sh
# edit hosts
sudo nano /etc/hosts 

# add an override to hosts
0.0.0.0          letsencrypt.local.guestcode.uk
```

## Run the site

Build the example and host on localhost  

```sh
# docker build 
docker build --no-cache -t nginx_ssl -f Dockerfile.nginx_ssl .             
docker run -it --rm -d -p 8080:443 --name web nginx_ssl

# debian
xdg-open https://localhost:8080
xdg-open https://letsencrypt.local.guestcode.uk:8080/

# macosx
open https://localhost:8080
open https://letsencrypt.local.guestcode.uk:8080/

# curl will fail because of self signed
curl https://localhost:8080     
curl -k https://localhost:8080  
curl -k https://letsencrypt.local.guestcode.uk:8080/   
```

## Verifying Certificates

```sh
# sslscan
sslscan --tls13 --no-ciphersuites --no-cipher-details --no-compression --no-fallback --no-groups --no-heartbleed --no-renegotiation letsencrypt.local.guestcode.uk:8080

# check ssl
openssl s_client -connect letsencrypt.local.guestcode.uk:8080 < /dev/null | openssl x509 -noout -text

# requires java
keytool -printcert -file ./certbot/config/live/letsencrypt.local.guestcode.uk-0001/fullchain.pem

# print chain
openssl s_client -connect letsencrypt.local.guestcode.uk:8080 -prexit -showcerts -state -status -tlsextdebug -verify 10

# show ciphers
nmap --script ssl-enum-ciphers -p 8080 letsencrypt.local.guestcode.uk
```

## Troubleshooting

```sh
# Get into container
docker exec -it web /bin/sh 

# exporting the certificate fields.
openssl x509 -in ./certbot/config/live/letsencrypt.local.guestcode.uk/fullchain.pem -text   
```

## Cleanup

```sh
# kill container
docker stop web

# remove the host entry
sudo nano /etc/hosts 

# remove the certificates from keychain and ca-certificates
```

## Resources

* Lets encrypt documentation [here](https://letsencrypt.org/docs/)
* Certbot repo [here](https://github.com/certbot/certbot)
* Certbot docs [here](https://eff-certbot.readthedocs.io/en/stable/)
* Discussion on generating localhost certs [here](https://letsencrypt.org/docs/certificates-for-localhost/)
* ACME Automatic Certificate Management Environment (ACME) [here](https://datatracker.ietf.org/doc/html/rfc8555)
* Lets encrypt staging [here](https://letsencrypt.org/docs/staging-environment/)
* challenge-types [here](https://letsencrypt.org/docs/challenge-types/)
* How To Acquire a Let's Encrypt Certificate Using DNS Valid [here](https://www.digitalocean.com/community/tutorials/how-to-acquire-a-let-s-encrypt-certificate-using-dns-validation-with-acme-dns-certbot-on-ubuntu-18-04)
* Expiration Emails [here](https://letsencrypt.org/docs/expiration-emails/)
* Certificate transparency log [here](https://crt.sh/)