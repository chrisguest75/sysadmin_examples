# BITWARDEN

NOTES:

* Free accounts for 2 users.  
* Has a secrets managet for automated processes.  
* Can be located in US or EU (when logging in be careful to select correct location or it can be confusing when password is not accepted)

## Install

Desktop

```sh
brew install bitwarden
```

CLI

```sh
brew install bitwarden-cli  
# or
nix-shell -p bitwarden-cli
```

## Login

```sh
# if configuring a tenant
bw config server https://vault.bitwarden.eu
# user and password 
# (NOTE: You may need to logout first so you can reacquire a session key)
bw login

export BW_SESSION="xxxxxxxxxxxxxxxxxx"
bw list items

bw list items --search ssh
```

## SSH Agent

You can use the desktop appliction as an ssh agent. [Details](https://bitwarden.com/help/ssh-agent/).  

REF: [08_ssh/README.md](../08_ssh/README.md)  

## Sharing .env files

You can add credentials as `notes`.  

```sh
mkdir -p ./out

cat <<EOF > ./out/.env
MY_API_KEY="123456789"
MY_USER="me@email.me"
EOF

bw list folders | jq .

bw list collections | jq .

export COLLECTION_ID=00000000-0000-0000-0000-000000000000
export FOLDER_ID=00000000-0000-0000-0000-000000000000

# Use base64 with cmd automation
export SECRET_NAME=my_test_secret
export ENVIRONMENT_FILE=./out/.env
export NOTES=$(cat $ENVIRONMENT_FILE | base64)
echo $NOTES

#export NOTES="hello"
bw get template item | jq ".type = 2 | .secureNote.type = 0 | .notes = \"${NOTES}\" | .name = \"${SECRET_NAME}\" | .folderId = \"${FOLDER_ID}\" | .collectionIds = [\"${COLLECTION_ID}\"]" | bw encode | bw create item
```

Search notes.  

```sh
# only find first secret with the name
bw list items --search "$SECRET_NAME" | jq -r '.[0].notes' | cat | base64 -d
```

## Resources

* https://bitwarden.com/
* https://bitwarden.com/help/github-actions-integration/
* https://bitwarden.com/help/ssh-agent/
* Password Manager CLI [here](https://bitwarden.com/help/cli)
