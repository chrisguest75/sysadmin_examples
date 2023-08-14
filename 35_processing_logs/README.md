# PROCESSING LOGS

Demonstrate how to use tooling to better work with logs.  

TODO:

* Logs in javascript object format not JSON...
* Switch format make it detect different logs

## Prereqs and Locations

```sh
# install
brew install lnav

# get version
lnav --version
lnav 0.11.2

# install locations
ls -la $(brew --prefix lnav)
ls -l /usr/local/Cellar/lnav/0.11.2
ls ~/.config/lnav/formats/default

code@default /Users/chris.guest/.config/lnav

# get help
lnav --help
```

## Keys

* `g` and `G` for top and bottom of files
* `:` enter config
* `;` query logs

## Theme

```sh
:config /ui/theme solarized-dark
```

## NGINX Example

```sh
# build exaple nginx container
docker build -t nginxlogs -f ./nginx/Dockerfile .    
docker run -it -p 8080:80 --rm -d --name nginxlogs nginxlogs

# make a request
curl 0.0.0.0:8080

# capture logs and follow
docker logs nginxlogs -f | lnav

# select parsed logs
;SELECT * from all_logs

# stop the container
docker stop nginxlogs
```

## Resources

* An advanced log file viewer for the small-scale [here](https://lnav.org/)  
* lnav Introduction [here](https://docs.lnav.org/en/latest/intro.html)
* tstack/lnav repo [here](https://github.com/tstack/lnav)  
* lnav Log Formats [here](https://docs.lnav.org/en/latest/formats.html)  
* Github Issues Automatic format for json log files [#634](https://github.com/tstack/lnav/issues/634)  
* Tutorials – lnav [here](https://www.linux-magazine.com/Issues/2017/196/Tutorials-lnav)
* hagfelsh/lnav_formats repo [here](https://github.com/hagfelsh/lnav_formats)
* The Art of Logging [reddit discussion](https://news.ycombinator.com/item?id=33054741)
* Log formats [reddit discussion](https://news.ycombinator.com/item?id=34243520)
