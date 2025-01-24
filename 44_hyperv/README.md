# HYPERV

Using HyperV on Windows Powershell.  

REF:[github.com/chrisguest75/powershell_examples/26_hyperv/README.md](https://github.com/chrisguest75/powershell_examples/blob/main/26_hyperv/README.md)  
REF: [github.com/chrisguest75/configuring_machines/windows/HYPERV.md](https://github.com/chrisguest75/configuring_machines/blob/master/windows/HYPERV.md)  

TODO:

* Install hyperv on linux powershell
* AFAICS you cannot install the hyperv management tools on linux powershell core.  

## Help

Use Powershell help to investigate the HyperV commands.  

```powershell
Update-Help

Get-help get-vm
get-module --ListAvailable

# list all cmdlets
Get-help hyper-v
```

## Listing

Listing available existing VMs.  

```powershell
Get-Vm
$vmname="vagrant_4gb_base_ubuntu_1710097247980_26078"
```

## Starting

Starting machines.  

```powershell
Start-Vm $vmname
```

## Stopping

```powershell
Stop-Vm $vmname
```

## Get Configuration

```powershell
get-vm $vmname | get-member
```

## Disks

```powershell
get-vhd (get-vm $vmname).id

# resize
resize-vhd -sizebytes 20gb -path "C:\Users\Public\Documents\Hyper-V\Virtual hard disks\Ubuntu 22.04 LTS.vhdx"

optimize-vhd -path "C:\Users\Public\Documents\Hyper-V\Virtual hard disks\Ubuntu 22.04 LTS.vhdx"
```

## Network

```powershell
Get-VM $vmname | Get-VMNetworkAdapter 
(Get-VM $vmname | Get-VMNetworkAdapter).IPAddresses
```

## Creating

```powershell
New-VM -Name "newVM" -Generation 2 -MemoryStartupBytes 4GB 

# on hyperv machine
sudo apt install openssh-server
# login from powershell
ssh vagrant@172.17.31.19 
```

## Resources

* Vagrant and Hyper-V: Don’t do it! [here](https://technology.amis.nl/tech/vagrant-and-hyper-v-dont-do-it/)  
* Vagrant Hyper-v and Ansible for disposable infrastructure environments [here](https://blog.gsilva.pro/vagrant-hyper-v-and-ansible-for-disposable-infrastructure-environments)  
