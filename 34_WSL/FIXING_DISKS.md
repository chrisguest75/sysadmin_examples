# FIXING DISKS

Information on checking and fixing vhd disks for distros.  

## Locate Disks

Use powershell to go through the disks.  

```ps
wsl --list --verbose

(Get-ChildItem -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss | Where-Object { $_.GetValue("DistributionName") -eq '2025_22_04_distro' }).GetValue("BasePath") + "\ext4.vhdx"

ls C:\Users\chris\Documents\WSLDistros\imported\2025_22_04_distro\ext4.vhdx
```

## 

## Resources

* https://www.reddit.com/r/linuxquestions/comments/pj3s24/run_fsck_towards_a_physical_partition_through_wsl/?rdt=65500
* https://learn.microsoft.com/en-us/windows/wsl/wsl2-mount-disk
* https://unix.stackexchange.com/questions/766981/ubuntu-file-system-read-only-after-windows-system-restore-at-previous-point
* https://anthony-f-tannous.medium.com/wsl2-how-to-prepare-and-attach-virtual-drives-vhd-ac17b1fc7a61

