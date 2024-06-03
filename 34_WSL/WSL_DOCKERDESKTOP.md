# DOCKER DESKTOP

TODO:

* I'm having reliability issues with docker in WSL.  Containers SEGFAULTING and then on a running again they work.

## Troubleshooting

Troubleshoot Docker Desktop [here](https://docs.docker.com/desktop/troubleshoot/overview/)  

NOTE: It will be written into `C:\Users\$env:USERNAME\AppData\Local\Temp\<guid>`  

```powershell
& "C:\Program Files\Docker\Docker\resources\com.docker.diagnose.exe" gather
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
