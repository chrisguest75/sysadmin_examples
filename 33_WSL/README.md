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
# the vhdx for distro (new distros are installed in packages folder)
dir "%LocalAppData%\packages\CanonicalGroupLimited.Ubuntu_79rhkp1fndgsc\localstate"


wslconfig /list
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

## Tips and Tricks

### SSH Agent

```sh
eval $(ssh-agent -s)
ssh-add /home/${USER}/.ssh/id_ed25519
```

### Collecting Logs

```ps1
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/WSL/master/diagnostics/collect-wsl-logs.ps1" -OutFile collect-wsl-logs.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force
.\collect-wsl-logs.ps1
```

### Git

When sharing clones between Windows and multiple WSL distros it seems ownership is checked.  

```sh
git config --global --add safe.directory '/mnt/c/Users/myuser/source/repos/myrepo'
```

## Resources

* microsoft/WSL [here](https://github.com/microsoft/WSL)
* diagnostics script [here](https://github.com/Microsoft/WSL/blob/master/diagnostics/collect-wsl-logs.ps1)
* Use an ssh-agent in WSL with your ssh setup from windows 10 [here](https://pscheit.medium.com/use-an-ssh-agent-in-wsl-with-your-ssh-setup-in-windows-10-41756755993e)
* How to install multiple instances of Ubuntu in WSL2 [here](https://cloudbytes.dev/snippets/how-to-install-multiple-instances-of-ubuntu-in-wsl2)
* Finding or Recovering your WSL Data [here](https://christopherkibble.com/posts/wsl-vhdx-recovery/)
* How to correct `git` reporting `detected dubious ownership in repository` without adding `safe.directory` when using WSL? [here](https://stackoverflow.com/questions/73485958/how-to-correct-git-reporting-detected-dubious-ownership-in-repository-withou)
