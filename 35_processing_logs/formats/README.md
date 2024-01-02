# FORMATS

* It's not matching any rows?

```sh
rm ./out/debug.log
cat ./in/test.log | lnav -W -d ./out/debug.log -I $(pwd)/config


ls -la  ~/.config/lnav/formats/installed      
cp formats/nginx_jsonl.json ~/.config/lnav/formats/installed
 

lnav -W -d ./debug.log ./processed.json
```

## Resources

* Formats [here](https://docs.lnav.org/en/latest/formats.html)
* Automatic format for json log files [#634](https://github.com/tstack/lnav/issues/634)
* Ability to force log format? [#454](https://github.com/tstack/lnav/issues/454)
* Custom JSON log parsing error [#975](https://github.com/tstack/lnav/issues/975)
