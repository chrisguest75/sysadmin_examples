# WSL (Windows Subsystem Linux)

Demonstrate WSL features and how to work with it.  

NOTES:

* It doesn't need HyperV, just Virtual machine platform required for WSL.  
* It runs one kernel for all WSL distros.  
* For speed your code should be copied into the vhdx.  

TODO:

* Import the distro as a vhdx. 
* Wsl --export --vhd filename. 
* Windows containers --isolation=process rather than hyper vm isolation for containers.
* Running gnome terminal
* Raft wsl - save vhdx - each distro has a vhdx file.
* Wsl unregister name
* Wslconfig to configure wsl memory 
* Podman desktop?
* Multipass?

## Starting

```sh
# step into wsl (use windows cmd prompt)
wsl

uname -a 
lsb_release -a 
```

## Installing 

```sh
# list available 
wsl --list --online

# list installed
wsl --list --all 

# show envvars 
set
# the vhdx for distro
dir "%LocalAppData%\packages\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\localstate"


wslconfig /list
```

## HyperV

```sh
hcsdiag list
```

## SSH Agent

```sh
eval $(ssh-agent -s)
ssh-add /home/${USER}/.ssh/id_ed25519
```

## Collecting Logs

```ps1
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/WSL/master/diagnostics/collect-wsl-logs.ps1" -OutFile collect-wsl-logs.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force
.\collect-wsl-logs.ps1
```

## Resources

* microsoft/WSL [here](https://github.com/microsoft/WSL)
* diagnostics script [here](https://github.com/Microsoft/WSL/blob/master/diagnostics/collect-wsl-logs.ps1)
* Use an ssh-agent in WSL with your ssh setup from windows 10 [here](https://pscheit.medium.com/use-an-ssh-agent-in-wsl-with-your-ssh-setup-in-windows-10-41756755993e)
* How to install multiple instances of Ubuntu in WSL2 [here](https://cloudbytes.dev/snippets/how-to-install-multiple-instances-of-ubuntu-in-wsl2)
* Finding or Recovering your WSL Data [here](https://christopherkibble.com/posts/wsl-vhdx-recovery/)
