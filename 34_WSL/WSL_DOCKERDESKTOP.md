# DOCKER DESKTOP

TODO:

* I'm having reliability issues with docker in WSL.  Containers SEGFAULTING and then on a running again they work.

## Troubleshooting

### Logs

```powershell
ls C:\Users\$env:USERNAME\AppData\Local\Docker\log\vm | sort-object -property LastWriteTime
```

## Resources

* https://docs.docker.com/config/daemon/logs/
