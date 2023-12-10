# BACKUP AND RESTORE

TODO:

* Import the distro as a vhdx.  

## Backup

It will only backup distros that have been closed down.  

```powershell
# look a running status
wsl --list --verbose

# backup (this seems to signal the distro to shutdown then fails.)
wsl --export Ubuntu-22.04 ubuntu22_04__2023_11_28.vhdx --vhd
```

## Resource

* Duplicate a Linux distro under WSL2 [here](https://fourco.nl/blogs/duplicate-a-linux-distro-under-wsl2/)
* "Error code: Wsl/Service/ERROR_SHARING_VIOLATION" [here](https://github.com/microsoft/WSL/issues/10737)
