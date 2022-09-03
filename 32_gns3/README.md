# README

Demonstrate some `gns3` examples.  

TODO:  

* Install appliance in a VM
* Build a simple network with vms or docker and capture traffic.

## Prerequisites

```sh
brew install gns3
```

https://www.gns3.com/software/download-vm

```sh
VBoxManage import ./GNS3\ VM/GNS3\ VM.ovf
```

NOTE: You have to create a host only network interface `vboxnet0`.

## Appliances

```sh
ll -a /Applications/GNS3.app/Contents/Resources/appliances 
cat /Applications/GNS3.app/Contents/Resources/appliances/vyos.gns3a    
cp  /Applications/GNS3.app/Contents/Resources/appliances/vyos.gns3a ./32_gns3/applicances                                  
```





## Resources

* https://www.gns3.com/
* https://gns3.com/marketplace/appliances
* https://www.ictshore.com/gns3/vms-in-gns3-virtualbox/


https://docs.vyos.io/en/equuleus/installation/virtual/gns3.html
