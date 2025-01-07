# COPYING FILES

Copying files between distros.  

NOTES:

* When using explorer to copy files it creates a `*:Zone.Identifier` file for every file copied.

## Explorer

Cleanup after explorer drag and drop.

``
find ../ -iname "*:Zone.Identifier" | wc -l
find ../ -iname "*:Zone.Identifier" -exec rm {} +

## Powershell

```powershell
# copy files restartable, 1 retry, wait 2 seconds, exclude node_modules with ETA and no individual file logging on copy. 
robocopy \\wsl.localhost\Ubuntu-24.04\home\chrisguest\Code \\wsl.localhost\2025_22_04_distro\home\chrisguest\code /E /Z /NFL /ETA /XD node_modules .nx /R:1 /W:2
```

## Resources

* Robocopy https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/robocopy