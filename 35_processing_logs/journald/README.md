# JOURNALD

`journalctl` is a command-line utility in Linux used to query and view logs generated by the systemd journal daemon, which is a centralized logging system present in many modern Linux distributions. The systemd journal is responsible for collecting and managing log messages from various system services, kernel messages, and user-level processes.

REF: [github.com/chrisguest75/shell_examples/27_journalctl/README.md](https://github.com/chrisguest75/shell_examples/blob/master/27_journalctl/README.md)  

## Pipe JournalD Logs

```sh
journalctl --since "1 hour ago" --no-pager --output=json | lnav
```

## Store and Analyse

```sh

journalctl --since "1 hour ago" --no-pager --output=json > ./journald/journald_example.json

mkdir -p ./out
rm ../out/debug.log          

lnav -W -d ./out/debug.log ./journald_example.json

lnav -W -d ./out/debug.log ../journald/journald_example_trim.json   
```

## Resources

