# VAGRANT WINDOWS

## Install

```sh
choco install vagrant
```

https://app.vagrantup.com/ubuntu

## Create

```sh
cd ./26_hyper

# set environment
[Environment]::SetEnvironmentVariable('VAGRANT_MACHINE_VALUES', '4gb_base_ubuntu.yaml')

dir env:VAGRANT_MACHINE_VALUES

# create
vagrant up --provider hyperv
```

## Connect

```powershell
# connect to the ssh
vagrant ssh

ssh vagrant@172.17.31.19 
```

## Troubleshooting

```powershell
# NOTE: If it fails you might need to kill the ruby.exe process.  

vagrant global-status
vagrant destroy --force
```

## Resources

* https://developer.hashicorp.com/vagrant/install
* https://github.com/nix-community/nixbox
* https://developer.hashicorp.com/vagrant/docs/other/wsl
* https://blog.gsilva.pro/vagrant-hyper-v-and-ansible-for-disposable-infrastructure-environments
* https://technology.amis.nl/tech/vagrant-and-hyper-v-dont-do-it/