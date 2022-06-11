# README

Demonstrate some `strace` basics  

## Examples

```sh
strace -f ./programs/sleeping.sh  

strace -e trace=network curl -s www.google.com > /dev/null

strace -f ./programs/waiting.sh  

./programs/waiting.sh  

# in another window
sudo strace -p 100501 
```

```sh
# library trace
ltrace -f bash
```

## 👀 Resources

* Linux application/script debugging with ‘strace’ [here](https://ma.ttias.be/linux-application-script-debugging-with-strace/)  
* https://opensource.com/article/19/10/strace
* https://medium.com/elements/diving-deeper-strace-9567ce531ee4