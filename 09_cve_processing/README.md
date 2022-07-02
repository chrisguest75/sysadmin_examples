# README

Demonstrates a script that will take a list of CVE and get the descriptions  

## Execute

```sh
mkdir -p ./out 

# a list of critical vulnerabilties.
./cve-summaries.sh --file=cves-critical.txt --action=cve 

# a list of high vulnerabilties.
./cve-summaries.sh --file=cves-high.txt --action=cve 

```

```sh
# we can slurp all these back together
./cve-summaries.sh --file=cves-critical.txt --action=cve | jq -s . 

./cve-summaries.sh --file=cves-critical.txt --action=cve | jq -s . > ./out/critical.json 
```

## Resources

* CVSS calculator [here](https://www.first.org/cvss/calculator/3.0)
