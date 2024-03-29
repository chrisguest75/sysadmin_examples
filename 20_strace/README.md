# README

Demonstrate some `strace` and `ltrace` basics  

## System Trace

strace - trace system calls and signals

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
# trace files a tool is loading
strace -f -e trace=file aws 

# in another window
./programs/waiting.sh > /dev/null &
# this traces child processes (follow forks)
sudo strace -c -f -p [PID]
sudo strace -f -p [PID]
sudo strace -e trace=file -f -p [PID]
```

### LNAV

REF: [35_processing_logs/README.md](../35_processing_logs/README.md)  

```sh
sudo strace -e trace=file -f -p [PID] | lnav
sudo strace -e trace=file -f -p [PID] 2>&1 ./out/strace1.log
lnav ./out/strace1.log

# pipe directly to lnav
sudo strace -e trace=file -f -p [PID] 2>&1 | lnav
```

## Library Trace

ltrace - A library call tracer

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
