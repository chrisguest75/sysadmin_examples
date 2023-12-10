# BACKUP AND RESTORE

Show how to backup and restore WSL distros.  

REF: [INSTALL_DISTRO.md](./INSTALL_DISTRO.md)  

## Backup

It will only backup distros that have been closed down.  

```powershell
# look a running status
wsl --list --verbose

# backup (this seems to signal the distro to shutdown then fails.)
# NOTE: This seems to be run inside a cmd prompt and then run pwsh - otherwise you get Error code: Wsl/Service/ERROR_SHARING_VIOLATION. 
# NOTE: I also got this working by performing `wsl --shutdown`
wsl --export Ubuntu-22.04 ubuntu22_04__2023_11_28.vhdx --vhd
```

## Restore VHDX

Restore a distro from a backed up VHDX.  

```powershell
$BACKUP_SOURCE="my_22_distro"
$DISTRO_NAME="new_22_distro"
wsl --import ${DISTRO_NAME} "${HOME}\Documents\WSLDistros\imported\${DISTRO_NAME}" "${HOME}\Documents\WSLDistros\backups\${BACKUP_SOURCE}__2023_12_10.vhdx" --vhd 

wsl --list --verbose

wsl -d ${DISTRO_NAME}
```

## Resource

* Duplicate a Linux distro under WSL2 [here](https://fourco.nl/blogs/duplicate-a-linux-distro-under-wsl2/)
* "Error code: Wsl/Service/ERROR_SHARING_VIOLATION" [here](https://github.com/microsoft/WSL/issues/10737)
