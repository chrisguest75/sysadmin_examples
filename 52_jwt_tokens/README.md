# JWT

TODO:

* Play around with some vulnerable auth packages.  

## JWT Algorithm Switching Vulnerability

```sh
. ./.env
echo ${JWT_TOKEN} |  base64 -di 
```

## Resources

* https://www.vaadata.com/blog/jwt-json-web-token-vulnerabilities-common-attacks-and-security-best-practices/