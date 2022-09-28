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

## Get schedules

```sh
# list the schedules
./opsgenie-lamp_v3.1.4 listSchedules --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf"

# export the schedules raw data
./opsgenie-lamp_v3.1.4 getScheduleTimeline --date "2022-08-03T00:00:00Z" --interval 31 --intervalUnit days --id  "00000000-0000-0000-0000-000000000000" --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" &> ../schedule.json

cat ../schedule.json| jq '.finalTimeline.rotations[] | select(.name == "north" or .name == "south") | .periods[]' | jq -s '. | sort_by(.startDate)'

# quick summary (does not account for special days)
cat ../schedule.json| jq '.finalTimeline.rotations[] | select(.name == "north" or .name == "south") | .periods[]' | jq -s '. | sort_by(.startDate) | group_by(.recipient.name) | map({"name":.[0].recipient.name, "count":length})'
```

## Modify Schedules

```sh
./opsgenie-lamp_v3.1.4 --help     

# list the schedules
./opsgenie-lamp_v3.1.4 listSchedules --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf"

# who is in each schedule? 
SCHEDULE_ID="EA17893A-2E1E-4466-8466-DCA647BB8A13"
USER_EMAIL="chris.guest@noemail.com"
./opsgenie-lamp_v3.1.4 listScheduleRotations --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" -id "${SCHEDULE_ID}"

ROTATION_ID="51D4ECC3-A142-4389-8457-79B6769C3AAF"
./opsgenie-lamp_v3.1.4 getScheduleRotation  --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" --id "${SCHEDULE_ID}" --rotation-id "${ROTATION_ID}"

./opsgenie-lamp_v3.1.4 listTeams --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf"  

# test 
TEAM_ID="4571EF83-76EE-40A9-8E3D-2E534FA2BC47"

./opsgenie-lamp_v3.1.4 getTeam --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" --id "${TEAM_ID}"
./opsgenie-lamp_v3.1.4 addMember --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" --teamId "${TEAM_ID}" --userName "${USER_EMAIL}"
./opsgenie-lamp_v3.1.4 removeMember --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" --teamId "${TEAM_ID}" --userName "${USER_EMAIL}"

./opsgenie-lamp_v3.1.4 listScheduleOverrides --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" -id "${SCHEDULE_ID}"


# redalert
/opsgenie-lamp_v3.1.4 getTeam --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" --id "${TEAM_ID}"
 

./opsgenie-lamp_v3.1.4 listScheduleRotations --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" -id "${SCHEDULE_ID}"

./opsgenie-lamp_v3.1.4 listRoutingRules --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" -id "${TEAM_ID}"

./opsgenie-lamp_v3.1.4 getRoutingRule --apiKey "${OPSGENIE_APIKEY}" --pretty --config "../lamp.conf" --teamId "${TEAM_ID}" --ruleId "B4A21CA9-57EF-427C-AB50-8B94EF314CF4"

./opsgenie-lamp_v3.1.4 getEscalation --apiKey "${OPSGENIE_APIKEY}" --config "../lamp.conf" --identifier "AD520173-D438-4DE0-8971-66734B653E99"  
```

## Creating Alerts

```sh
# get a 403 for this "To perform this action, use an API key from an API integration". 
./opsgenie-lamp_v3.1.4 createAlert --apiKey "${OPSGENIE_TEST_APIKEY}" --config "../lamp.conf" --message "Test Alert" --priority P1 --schedules "${SCHEDULE_ID}"
```

## Quokka

Use quokka to aggregate with logic.  

Ref: 27_quokka [here](https://github.com/chrisguest75/typescript_examples/tree/master/27_quokka)  

## Resources

* API Overview [here](https://docs.opsgenie.com/docs/api-overview)
* Lamp: Command Line [here](https://docs.opsgenie.com/docs/lamp-command-line-interface-for-opsgenie)
* opsgenie/opsgenie-lamp repo [here](https://github.com/opsgenie/opsgenie-lamp)
* opsgenie/opsgenie-lamp releases [here](https://github.com/opsgenie/opsgenie-lamp/releases/tag/v3.1.4)  
* Ability to format Slack messages using markdown [here](https://community.atlassian.com/t5/Opsgenie-Discussions/Ability-to-format-Slack-messages-using-markdown/td-p/1662611)
* BUG: Convert alerts containing HTML into Slack custom formatting [here](https://jira.atlassian.com/browse/OPSGENIE-227)  
