# WSL (Windows Subsystem Linux)

Demonstrate WSL features and how to work with it.  

NOTES:

* It doesn't need HyperV, just Virtual machine platform required for WSL.  
* It runs one kernel for all WSL distros.  
* For speed your code should be copied into the vhdx.  
  * File IO is really impaired pulling data across the share
  * This really matters with directories like node-modules.  
* WSLG is for graphics - it's possible to run GFX apps from linux in windows.  
* When performing updates it seems to replace the kernel.  

TODO:

* https://fourco.nl/blogs/access-to-wsl-filesystem-in-explorer/
* Windows containers --isolation=process rather than hyper vm isolation for containers.
* Running gnome terminal
* Raft wsl - save vhdx - each distro has a vhdx file.
* Wsl unregister name
* Wslconfig to configure wsl memory  
* Podman desktop?
* Multipass?

## Installing

```sh
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux 

# wsl versions (including kernel)
wsl --version

# list available 
wsl --list --online

# list installed
wsl --list --all 

# show envvars 
set
# the vhdx for distro (new distros are installed in packages folder)
dir "%LocalAppData%\packages\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\localstate"

wslconfig /list
```

## Upgrading

Check releases [here](https://github.com/microsoft/WSL/releases)  

WARNING: This seems to replace the kernel. So if you're on a custom build it will replace it.  

```powershell
wsl --update
```

## Starting

```sh
# step into wsl (use windows cmd prompt)
wsl

uname -a 
lsb_release -a 

# print versions
cat /mnt/wslg/versions.txt

# show memory
ls /proc/meminfo
```

## HyperV

```sh
hcsdiag list
```

## Second distro

```sh
wsl --install ubuntu-22.04

# step into non default wsl
wsl -d ubuntu-22.04
```

## Remove distro

```sh
# DANGER: asks for no confirmation and is terminal 
wsl --unregister ubuntu-22.04

# show folders (it removes vhdx but not folder)
dir "%LocalAppData%\packages\"
```

## Shutting down

```sh
wsl --shutdown
```

## Tips and Tricks

### SSH Agent

```sh
eval $(ssh-agent -s)
ssh-add /home/${USER}/.ssh/id_ed25519
```

### Collecting Logs

Collecting logs for troubleshooting. It will open a process and wait for you to attempt an action. Once complete press a key and open the ETL file in Event Viewer.  

```ps1
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/WSL/master/diagnostics/collect-wsl-logs.ps1" -OutFile collect-wsl-logs.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force
.\collect-wsl-logs.ps1
```

### Mounts

drvfs

```cmd
# it's possible to list directory contents from windows through \\wsl.localhost
dir \\wsl.localhost\ubuntu\etc
```

```sh
nano /etc/wsl.conf

[automount]
enabled=true
options=metadata,uid=1000,gid=1000,umask=022

# shutdown 
wsl --shutdown

# check mount

# mount (default)
drvfs on /mnt/c type 9p (rw,noatime,dirsync,aname=drvfs;path=C:\;uid=1000;gid=1000;symlinkroot=/mnt/,mmap,access=client,msize=262144,trans=virtio)

# 2nd distro install
drvfs on /mnt/c type 9p (rw,noatime,dirsync,aname=drvfs;path=C:\;uid=0;gid=0;symlinkroot=/mnt/,mmap,access=client,msize=262144,trans=virtio)
```

### Git

When sharing clones between Windows and multiple WSL distros it seems ownership is checked.  

```sh
# if you don't update wsl.conf you can mark safe.  
git config --global --add safe.directory '/mnt/c/Users/myuser/source/repos/myrepo'
```

### Time sync

It seems that clocks from windows and WSL can drift.  This can lead to some API requests failing if they're signed (i.e. AWS CLI).

```sh
# sync clock
sudo hwclock -s

# check new time
date
```

## Resources

* microsoft/WSL [here](https://github.com/microsoft/WSL)
* microsoft/WSLG [here](https://github.com/microsoft/wslg)
* diagnostics script [here](https://github.com/Microsoft/WSL/blob/master/diagnostics/collect-wsl-logs.ps1)
* Use an ssh-agent in WSL with your ssh setup from windows 10 [here](https://pscheit.medium.com/use-an-ssh-agent-in-wsl-with-your-ssh-setup-in-windows-10-41756755993e)
* How to install multiple instances of Ubuntu in WSL2 [here](https://cloudbytes.dev/snippets/how-to-install-multiple-instances-of-ubuntu-in-wsl2)
* Finding or Recovering your WSL Data [here](https://christopherkibble.com/posts/wsl-vhdx-recovery/)
* How to correct `git` reporting `detected dubious ownership in repository` without adding `safe.directory` when using WSL? [here](https://stackoverflow.com/questions/73485958/how-to-correct-git-reporting-detected-dubious-ownership-in-repository-withou)
* Chmod/Chown WSL Improvements [here](https://devblogs.microsoft.com/commandline/chmod-chown-wsl-improvements/)  
* Automatically Configuring WSL [here](https://devblogs.microsoft.com/commandline/automatically-configuring-wsl/)  
* WSL drvfs mount issues — user mapping not recognised? [here](https://superuser.com/questions/1439265/wsl-drvfs-mount-issues-user-mapping-not-recognised)
* Advanced settings configuration in WSL [here](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#configure-per-distro-launch-settings-with-wslconf)
* Installing WSL (windows subsystem for linux) Gist [here](https://gist.github.com/ecarlson94/283102ffd2f2473d41e7c9965be8fdd4)
* WSL2, Ubuntu-22.04 and the correct /etc/wsl.conf configuration [here](https://basila.medium.com/wsl2-ubuntu-22-04-and-the-correct-etc-wsl-conf-configuration-d332af95d770)  
* The Ultimate Guide to Windows Subsystem for Linux (Windows WSL) [here](https://adamtheautomator.com/windows-subsystem-for-linux/)  
