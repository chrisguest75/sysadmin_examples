# Shodan

Demonstrate a basic example of using `shodan`  

TODO:  

* Add a dockerfile to run showdan in.  

## Install

```sh
# install the python shodan client
sudo apt install python3-shodan

# configure with apikey
shodan init <apikey>
```

## Scan

```sh
# find address
ip -4 address
curl https://api4.my-ip.io/ip.json

ip -6 address
curl https://api6.my-ip.io/ip.json

# submit a scan
shodan scan submit <ip>
```

## Resources

* Shodan Dashboard (requires account) [here](https://www.shodan.io/dashboard?language=en)
* Test your IPv6 connectivity. [here](https://testv6.com)
* What Is Shodan? How to Use It & How to Stay Protected 2022 [here](https://www.safetydetectives.com/blog/what-is-shodan-and-how-to-use-it-most-effectively/)
* Shodan API Reference [here](https://developer.shodan.io/api)
* 36 public asciicasts by Shodan [here](https://asciinema.org/~Shodan)
