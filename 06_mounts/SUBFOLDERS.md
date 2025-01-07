# SUBFOLDERS

NOTES:

* Mounts on nix under `/run/media` are `root:root` owned. Create a folder underneath and change ownership.  

## Subfolders

Create a subfolder to copy files into.  

```sh
cd /run/media/${USER}/sda

# directory on owner
mkdir -p backup
sudo chmod -R u+w ./backup 
sudo chown -R ${USER}:users ./backup

# backup files
rsync --stats --update -r /run/media/${USER}/samba/myfolder/* /run/media/${USER}/sda/backup
```

## Resources


