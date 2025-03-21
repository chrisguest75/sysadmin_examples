# OSV SCANNER

Use OSV-Scanner to find existing vulnerabilities affecting your project's dependencies.  

## Install

```sh
just nix
```

## Scan

```sh
just scan-repo $(git root)

# scan a current repo with json output
just scan-repo $(git root) --json | jq .

# scan a repo with json output
just scan-repo ../my_repo --json | jq .
```

## Docker Images

```sh
docker pull nginx:1.27.4
osv-scanner scan --docker nginx:1.27.4
```

## Resources

* https://github.com/google/osv-scanner-v1
* https://github.com/google/osv-scanner