# README

Demonstrate `opsgenie` cli management commands.  

## Download

```sh
# get zip
curl -o opsgenie-lamp_3.1.4_darwin_amd64.zip -L https://github.com/opsgenie/opsgenie-lamp/releases/download/v3.1.4/opsgenie-lamp_3.1.4_darwin_amd64.zip

# unpack
unzip ./opsgenie-lamp_3.1.4_darwin_amd64.zip -d ./opsgenie-lamp_3.1.4_darwin_amd64
```

## Using CLI

```sh
. ../.env  

./opsgenie-lamp_v3.1.4 help   

./opsgenie-lamp_v3.1.4 listTeams --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" 

./opsgenie-lamp_v3.1.4 listServices --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" 

# create alert help
./opsgenie-lamp_v3.1.4 createAlert --help  

# use $'\n' to get newlines 
./opsgenie-lamp_v3.1.4 createAlert --apiKey "${OPSGENIE_APIKEY}" --config "../lamp.conf" --message "A test alert" --description $'* Organise communication\n* Follow runbooks if applicable\n* Do not panic\n\n'
```

## Resources

* API Overview [here](https://docs.opsgenie.com/docs/api-overview)
* Lamp: Command Line [here](https://docs.opsgenie.com/docs/lamp-command-line-interface-for-opsgenie)
* opsgenie/opsgenie-lamp repo [here](https://github.com/opsgenie/opsgenie-lamp)
* opsgenie/opsgenie-lamp releases [here](https://github.com/opsgenie/opsgenie-lamp/releases/tag/v3.1.4)  
* Ability to format Slack messages using markdown [here](https://community.atlassian.com/t5/Opsgenie-Discussions/Ability-to-format-Slack-messages-using-markdown/td-p/1662611)
* BUG: Convert alerts containing HTML into Slack custom formatting [here](https://jira.atlassian.com/browse/OPSGENIE-227)  