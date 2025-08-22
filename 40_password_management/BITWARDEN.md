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
MY_API_KEY=123456789
MY_USER=me@email.me
EOF

bw list folders | jq .

bw list collections | jq .

bw get template item | jq '.type = 2 | .secureNote.type = 0 | .notes = "Contents of my Secure Note." | .name = "My Secure Note"'


export COLLECTION_ID=00000000-0000-0000-0000-000000000000
export FOLDER_ID=00000000-0000-0000-0000-000000000000
export NOTES=$(awk '{printf "%s\\n", $0}' ./out/.env)

cat <<EOF > ./out/note.json
{
  "type": 2,
  "name": "My Secure Note",
  "notes": "$(awk '{printf "%s\\n", $0}' ./out/.env)",
  "folderId": "${FOLDER_ID}",
  "collectionIds": ["${COLLECTION_ID}"]
}
EOF
bw create item "$(bw encode < ./out/note.json)"

bw get template item | jq ".type = 2 | .secureNote.type = 0 | .notes = \"${NOTES}\" | .name = \"My Secure Note\" | .folderId = \"${FOLDER_ID}\" | .collectionIds = [\"${COLLECTION_ID}\"]" | bw encode | bw create item
```

Search notes.  

```sh
bw list items --search "My Secure Note" | jq -r '.[0].notes' | cat
```

## Resources

* https://bitwarden.com/
* https://bitwarden.com/help/github-actions-integration/
* https://bitwarden.com/help/ssh-agent/
* Password Manager CLI [here](https://bitwarden.com/help/cli)
