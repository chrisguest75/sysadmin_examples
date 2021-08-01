# README
Demonstrate using nmap to port scan services

TODO:
* Detect CVE on nginx - is it possible to exploit it? 

## Sharing network namespace
```sh
docker compose config --profiles

# you have to build with profiles as well
docker compose --profile nginx build --no-cache  

docker compose --profile nginx up -d  
#docker compose up -d                
```

```sh
docker exec -it  $(docker ps --filter name=12_nmap_debug_nginx_1 -q) /bin/bash 
```

Show all processes in the namespace from the debug container
```sh
# should see node process in other container
ps -aux

# pid of current bash
echo $BASHPID 

# check network namespace access
curl 0.0.0.0:80
```

## Use nmap to scan
```sh
nmap --version

# show built in scripts
ls -1 /usr/share/nmap/scripts

# scan the services inside the current network namespace
nmap -sV 0.0.0.0

# scan the host (docker for mac)
ping host.docker.internal
nmap -sV host.docker.internal

# scan nginx port
nmap -p 80 -sV -A 0.0.0.0

# give a list back of the CVE 
nmap -p 80 -sV -A 0.0.0.0 --script vulners 

# script help
nmap --script-help vulners

# vulscan
git clone https://github.com/scipag/vulscan scipag_vulscan
ln -s `pwd`/scipag_vulscan /usr/share/nmap/scripts/vulscan    
nmap -sV --script=vulscan/vulscan.nse 0.0.0.0 
```

### Cleanup nginx
```sh
docker compose --profile nginx down    
```

# Resources
## Documentation
* NMap site [here](https://nmap.org/)  
* NMap Book [here](https://nmap.org/book/toc.html)  
* Tutorial [here](https://hackertarget.com/nmap-tutorial/)

## Vulnerability Scanning
* nmap-vulners [here](https://github.com/vulnersCom/nmap-vulners)
* vulscan [here](https://github.com/scipag/vulscan)  
* 12 useful scripts [here](https://research.securitum.com/nmap-and-12-useful-nse-scripts/)  