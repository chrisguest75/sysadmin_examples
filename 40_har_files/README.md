# HAR FILES

TODO:

* How do we clean them?

NOTES:

* Be careful to not psss on secrets in cookies.  

## Chrome Creation

You can use browsers to create them. You can also load them back into browsers.

```sh
cd ./40_har_files
mkdir -p ./hars/web
```

## Headless capture

Use headless chrome to capture a pageload.  

```sh
mkdir -p ./hars/docker

# build
docker build -f ./Dockerfile.chrome -t chrome .

# run
docker run --rm -it -v ./hars/docker:/data --name chrome chrome --output /data/www.google.com.har "https://www.google.com"
```

## Compare

Use sitespeed to compare two captures.  

```sh
# build sitespeed
docker build -f ./Dockerfile.sitespeed -t sitespeed .
docker run --rm -v ./hars:/data -p 8080:8080 -p 8081:8081 -it --name sitespeed sitespeed 

# run a CORS ALLOWED nginx to host har files.  
cd ./40_har_files
docker run --rm -v ./default.conf:/etc/nginx/conf.d/default.conf -v ./hars:/usr/share/nginx/html -p 8090:80  -it --name harfiles nginx:1.23.1 

# test hosting
curl -I http://0.0.0.0:8090/docker/www.google.com.har
curl -I http://0.0.0.0:8090/web/www.google.com.har

# use localhost in the ui on windows (might be 0.0.0.0 on macosx)
http://localhost:8090/docker/www.google.com.har
http://localhost:8090/web/www.google.com.har
```

## Resources

* How to get a HAR capture [here](https://toolbox.googleapps.com/apps/har_analyzer/)
* HAR (file format) [here](https://en.wikipedia.org/wiki/HAR_(file_format))
* A Comprehensive Guide on HAR Files [here](https://www.keysight.com/blogs/en/tech/nwvs/2022/05/27/a-comprehensive-guide-on-har-files)
* Compare HAR files [here](https://github.com/sitespeedio/compare#compare-har-files)
* HAR 1.2 Spec [here](http://www.softwareishard.com/blog/har-12-spec/)
* Automate Chrome HAR capture with Docker [here](https://www.jamesgallagher.ie/automated-chrome-har-capture/)
* chrome-har-capturer [here](https://www.npmjs.com/package/chrome-har-capturer)
