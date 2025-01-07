# README

Demonstrates how to create a simple samba file share.  

Samba is a file sharing service that provides seamless file and print services to SMB/CIFS clients, allowing interoperability between Unix/Linux systems and Windows clients.  

Many of the above weaknesses of SMBv1 are addressed in the latest versions of SMB (e.g., SMB 3.x), which include improvements in security, performance, and functionality. Modern SMB versions support strong encryption, secure authentication, and integrity checking.  

## Reason

This is an easy way to share files to/from a Vagrant box or around a home network.  

TODO:

* Rotate password for share
* Access logs

## Glossary

* Server Message Block (SMB)
* Common Internet File System (CIFS)

## Install and create samba share

```sh
# check files it will install using apt-file
apt-file list samba

# is samba already installed 
apt list --installed | grep samba

sudo apt install samba
```

```sh
# find the installation directory
whereis samba

# view the config
cat /etc/samba/smb.conf   

# create a folder to share
mkdir -p /home/$(whoami)/shares/sambashare
```

Add the following config to /etc/samba/smb.conf.  Replace \[username\] with your username.  

```sh
# edit config file
nano /etc/samba/smb.conf
```

```ini
[sambashare]
    comment = Samba on ubuntu
    path = /home/[username]/shares/sambashare
    read only = no
    browsable = yes
```

```sh
# reload the config
sudo service smbd restart

# list apps for the firewall
sudo ufw app list

# should show something like
> Available applications:
>  OpenSSH
>  Samba

# list info on what samba exemption does
sudo ufw app info Samba                             

> Profile: Samba
>  Title: LanManager-like file and printer server for Unix
> Description: The Samba software suite is a collection of programs that
> implements the SMB/CIFS protocol for unix systems, allowing you to serve
> files and printers to Windows, NT, OS/2 and DOS clients. This protocol is
> sometimes also referred to as the LanManager or NetBIOS protocol.
>
> Ports:
>  137,138/udp
>  139,445/tcp

# we can allow the application
sudo ufw allow samba

# set a password for a non system account
sudo smbpasswd -a [a share username]

# get ip address   
ip addr
```

## Samba Client (shell)

Connect to the share from another computer  

Easiest is to use a GUI client and connect to
```smb://[ip addr]/[name of share]```  

### Install

```sh
# debian
sudo apt install smbclient
```

### Connect using shell

```sh
# list the shares
smbclient -L //[ip address] -U vagrant

# connect to the "sambashare"
smbclient //[ip address]/sambashare -U vagrant 
```

Mounting samba share

```sh
# location to host mount
sudo mkdir -p /run/media/chrisguest/samba/multimedia 

# samba share
export PASSWORD=xxxx
sudo mount -t cifs -o username=user1,password=${PASSWORD} //192.168.1.101/folder1 /run/media/chrisguest/samba/folder1 
```

## Connect using MacOSX Finder

Use `⌘+k` in finder to open the share dialog - use ```smb://[ip addr]/[name of share]``` to connect and enter your username and password.  

```sh
# mounted under /Volumes
ls /Volumes/[name of share]   
```

## Connect using IOS Files

Use ```smb://[ip addr]/[name of share]``` to connect and enter your username and password.  

## Troubleshooting

```sh
# list users
sudo pdbedit -L -v        

# who is connected to the shares right now
sudo smbstatus   
sudo smbstatus --help        

smbpasswd --help  
```

## Resources

* Ubuntu Sambashare [install-and-configure-samba](https://ubuntu.com/tutorials/install-and-configure-samba#1-overview)
* https://www.samba.org/samba/
