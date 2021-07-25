# README
Demonstrate using nmap to port scan services

# Install the framework


### Sharing network namespace
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

nmap -sV 0.0.0.0

nmap -p 80 -sV -A 0.0.0.0
```

### Cleanup nginx
```sh
docker compose --profile nginx down    
```



# Resources

https://nmap.org/
https://nmap.org/book/toc.html
https://hackertarget.com/nmap-tutorial/


https://github.com/vulnersCom/nmap-vulners
https://github.com/scipag/vulscan