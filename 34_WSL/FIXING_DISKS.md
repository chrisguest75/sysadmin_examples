# FIXING DISKS

Information on checking and fixing vhd disks for distros.  

## Locate Disks

Use powershell to go through the disks.  

```powershell
wsl --list --verbose

$DISTRO_NAME="Ubuntu-24.04"  
$location=(Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss | Where-Object { $_.GetValue("DistributionName") -eq "$DISTRO_NAME" }).GetValue("BasePath") + "\ext4.vhdx"

echo $location
```

## Mount on Host

```powershell
# in admin powershell
Write-Output "\\.\PhysicalDrive$((Mount-VHD -Path "$location" -PassThru | Get-Disk).Number)"

# list drives
diskmgmt
# or
GET-CimInstance -query "SELECT * from Win32_DiskDrive"

# physical drive number comes from command before
wsl --mount \\.\PhysicalDrive1 --bare
```

## WSL

```sh
# enter wsl
wsl 

# look for drive matching size. 
lsblk 
# you should be able to see the drive being mounted
dmesg 
```

## Fix

```sh
sudo e2fsck -f /dev/sdd
```

## Host Powershell

```powershell
wsl --unmount \\.\PhysicalDrive1

# list drives
diskmgmt
# or
GET-CimInstance -query "SELECT * from Win32_DiskDrive"

#To detach it completely (eg. if you want to (re)move the file)
Dismount-VHD "${location}"
```

## Resources

* https://www.reddit.com/r/linuxquestions/comments/pj3s24/run_fsck_towards_a_physical_partition_through_wsl/?rdt=65500
* https://learn.microsoft.com/en-us/windows/wsl/wsl2-mount-disk
* https://unix.stackexchange.com/questions/766981/ubuntu-file-system-read-only-after-windows-system-restore-at-previous-point
* https://anthony-f-tannous.medium.com/wsl2-how-to-prepare-and-attach-virtual-drives-vhd-ac17b1fc7a61

