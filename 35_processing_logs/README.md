# PROCESSING LOGS

Demonstrate how to use tooling to better work with logs.  

TODO:

* Get nginx errors logs in json as well.  
* Logs in javascript object format not JSON...
* Switch format make it detect different logs
* Setup an nginx example with lots of requests and aggregate them.  

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

code@default /Users/$(whoami)/.config/lnav

# get help
lnav --help
```

## Keys

* `ENTER` for selecting from breadcrumb menu
* `g` and `G` for top and bottom of files
* `:` enter config
* `;` query logs (sqlite)

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

# capture logs and follow - save a debug log for tracking format issues.
rm ./out/debug.log
docker logs nginxlogs --follow | lnav -W -d ./out/debug.log

# select parsed logs 
;SELECT * from all_logs

# stop the container
docker stop nginxlogs
```

## NGINX JSONL Example

NOTE: THIS IS NOT WORKING - IT FAILS TO PARSE JSONLINES....  
IT MIGHT BE BECAUSE SOME OF THE FIELDS ARE INTEGERS.  
"scan with format (nginx_jsonl) does not match -- file is not JSON-lines"

```sh
### DEBUG WITH TEST LOGS ###
cat ./in/test.log | jq  .   

rm ./out/debug.log
cat ./in/test.log | lnav -W -d ./out/debug.log -I $(pwd)/config
```

* Press `ENTER` and select "SCHEMA"
* Search for `nginx_jsonl` using `/`

```sh
# build exaple nginx container
docker build -t nginxlogs -f ./nginx/Dockerfile.jsonl .    
docker run -it -p 8080:80 --rm -d --name nginxlogs nginxlogs

# make a request
curl 0.0.0.0:8080

# capture logs and follow - save a debug log for tracking format issues.
rm ./out/debug.log
docker logs nginxlogs --follow | lnav -W -d ./out/debug.log -I $(pwd)/config

# select parsed logs
;SELECT * from all_logs

# stop the container
docker stop nginxlogs
```

## Resources

* An advanced log file viewer for the small-scale [here](https://lnav.org/)  
* lnav Introduction [here](https://docs.lnav.org/en/latest/intro.html)
* tstack/lnav repo [here](https://github.com/tstack/lnav)  
* Tutorials – lnav [here](https://www.linux-magazine.com/Issues/2017/196/Tutorials-lnav)
* hagfelsh/lnav_formats repo [here](https://github.com/hagfelsh/lnav_formats)
* The Art of Logging [reddit discussion](https://news.ycombinator.com/item?id=33054741)
* Log formats [reddit discussion](https://news.ycombinator.com/item?id=34243520)
* Tech Blog: How to configure JSON logging in nginx? [here](https://www.velebit.ai/blog/nginx-json-logging/)

### Formats

* lnav Log Formats [here](https://docs.lnav.org/en/latest/formats.html)  
* Github Issues Automatic format for json log files [#634](https://github.com/tstack/lnav/issues/634)  
* Ability to force log format? [#454](https://github.com/tstack/lnav/issues/454)
* Custom JSON log parsing error [#975](https://github.com/tstack/lnav/issues/975)




https://jsonlines.org/?ref=dbconvert.com
https://docs.lnav.org/en/latest/formats.html#format-file-reference

