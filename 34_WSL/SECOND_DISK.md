# SECOND DISKS

Add second drives for managing codebases away from root drive.  

## Create

```powershell
# in admin powerhsell
$DISTRO_NAME = "2025work_24_04_distro"   
New-VHD "${HOME}\Documents\WSLDistros\imported\${DISTRO_NAME}\code.vhdx" -SizeBytes 200GB -Dynamic -BlockSizeBytes 1MB
```

## Mount on Host

```powershell
# in admin powershell
Write-Output "\\.\PhysicalDrive$((Mount-VHD -Path "${HOME}\Documents\WSLDistros\imported\${DISTRO_NAME}\code.vhdx" -PassThru | Get-Disk).Number)"

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

## Partition

```sh
# elevate
sudo -i

fdisk /dev/sdf

# new GPT partition
g 
# new parition 
n
# write and exit 
w
```

## Format

```sh
mkfs.ext4 -G 4096 /dev/sdf1
mkdir ./code
```

## Mount

```sh
mount -o rw /dev/sdf1 ./code
# change ownership of folder to prevent read-only
sudo chown -R ${USER}:chrisguest ./code
```

## Umount

```sh
umount ./code
```


```powershell
wsl --unmount \\.\PhysicalDriveX

#To detach it completely (eg. if you want to (re)move the file)
Dismount-VHD support.vhdx
```


## Resources

* https://gist.github.com/lseongjoo/d38b29fdbd5c082880576d0c34f7593e
* https://learn.microsoft.com/en-us/windows/wsl/wsl2-mount-disk
* https://learn.microsoft.com/en-us/windows/wsl/disk-space