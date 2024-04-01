# GIT SSH

Goto [](./git-server/README.md) and install a local server.  

TODO:

* gitea rsa key has to be 3072 key length

## User SSH key

```sh
# copy thumbprint
LIBYKCS11_PATH=$(realpath /usr/local/lib/libykcs11.dylib)
LIBYKCS11_PATH=/home/linuxbrew/.linuxbrew/lib/libykcs11.so

# copy the key to gitea
ssh-keygen -D ${LIBYKCS11_PATH} -e | grep Signature 
```


## Resources

* SSH key cannot be verified due to 2047 lengt [here](https://github.com/go-gitea/gitea/issues/20249)  
