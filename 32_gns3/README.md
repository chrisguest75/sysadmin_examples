# README

Demonstrate some `gns3` examples.  

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
