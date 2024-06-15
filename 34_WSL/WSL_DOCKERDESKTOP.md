# DOCKER DESKTOP

TODO:

* I'm having reliability issues with docker in WSL.  Containers SEGFAULTING and then on a running again they work.

## Check

```powershell
# go run checks 
& "C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe" check
```

## Try

```powershell
wsl.exe --update --web-download
```

## Troubleshooting

Troubleshoot Docker Desktop [here](https://docs.docker.com/desktop/troubleshoot/overview/)  

NOTE: It will be written into `C:\Users\$env:USERNAME\AppData\Local\Temp\<guid>`  

```powershell
# will write out zip path at the end
& "C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe" gather

# Writes to C:\Users\$env:USERNAME\AppData\Roaming\Docker
& "C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe" gather ./docker-crash.zip

# expand the archive
expand-Archive .\20240604164400.zip -DestinationPath .\20240604164400
```

```sh
# unzip contents
unzip 20240603163018.zip -d 20240603163018
```

### Collecting WSL Logs

Collecting logs for troubleshooting. It will open a process and wait for you to attempt an action. Once complete press a key and open the ETL file in Event Viewer.  

```ps1
Invoke-WebRequest -UseBasicParsing "https://raw.githubusercontent.com/microsoft/WSL/master/diagnostics/collect-wsl-logs.ps1" -OutFile collect-wsl-logs.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force
.\collect-wsl-logs.ps1
```

### Logs

```powershell
ls C:\Users\$env:USERNAME\AppData\Local\Docker\log\vm | sort-object -property LastWriteTime
```




## Resources

* https://docs.docker.com/config/daemon/logs/
