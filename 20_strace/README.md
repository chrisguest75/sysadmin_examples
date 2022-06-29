# README

Demonstrate some `strace` basics  

## System Trace

```sh
# count syscalls whilst running in bash
strace -c -f ./programs/sleeping.sh  

# count network syscalls for ping 
strace -c -e trace=network -f ./programs/ping.sh  > /dev/null
strace -c -e trace=process,network -f ./programs/ping.sh  > /dev/null

# count for curl
strace -e trace=network curl -s www.google.com > /dev/null

# count syscalls whilst running in bash
strace -c -f ./programs/waiting.sh  

# file syscalls
strace -c -e trace=file -f ./programs/listing.sh  

# create a file and copy tracing
strace -c -e trace=file -f ./programs/create_and_copy.sh  


# in another window
./programs/waiting.sh > /dev/null &
sudo strace -c -p [PID]
```

## Library Trace

```sh
# install ltrace
apt install ltrace  

# manpages
man ltrace 

# library trace
ltrace -f bash
```

## 👀 Resources

* Linux application/script debugging with ‘strace’ [here](https://ma.ttias.be/linux-application-script-debugging-with-strace/)  
* https://opensource.com/article/19/10/strace
* https://medium.com/elements/diving-deeper-strace-9567ce531ee4