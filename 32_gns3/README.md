# README

Demonstrate some `gns3` examples.  

TODO:  

* Install appliance in a VM
* Build a simple network with vms or docker and capture traffic.

## Prerequisites

VirtualBox  
vncviewer 
wireshark - `ln -s /usr/bin/wireshark ~/GNS3/wireshark/` 
iso's  
Nested VM processor? 

`VBoxManage modifyvm <VirtualMachineName> --nested-hw-virt on`

Linux: https://docs.gns3.com/docs/getting-started/installation/linux/

```sh
brew install gns3
```

https://www.gns3.com/software/download-vm

```sh
VBoxManage import ./GNS3\ VM/GNS3\ VM.ovf
```

NOTE: You have to create a host only network interface `vboxnet0`.

## Appliances

MacOS

```sh
ll -a /Applications/GNS3.app/Contents/Resources/appliances 
cat /Applications/GNS3.app/Contents/Resources/appliances/vyos.gns3a    
cp  /Applications/GNS3.app/Contents/Resources/appliances/vyos.gns3a ./32_gns3/applicances                                  
```

Linux

```sh
ll -a ~/GNS3/appliances  
```




## Resources

* https://www.gns3.com/
* https://gns3.com/marketplace/appliances
* https://www.ictshore.com/gns3/vms-in-gns3-virtualbox/


https://docs.vyos.io/en/equuleus/installation/virtual/gns3.html


https://github.com/GNS3/dynamips

https://wiki.archlinux.org/title/GNS3

https://www.techtarget.com/searchitoperations/tip/Tips-to-launch-VirtualBox-nested-virtualization

https://stackoverflow.com/questions/54251855/virtualbox-enable-nested-vtx-amd-v-greyed-out
NOTE: it can be enabled 

VMX - Virtual-Machine Extensions = 0 (1)
Ept - Extended Page Tables = 0 (1)
UnrestrictedGuest - Unrestricted guest = 0 (1)
VmcsShadowing - VMCS shadowing = 0 (1)

http://cdimage.kali.org/kali-2022.3/

Docker Nettools
https://github.com/Someguy123/docker-networktools

