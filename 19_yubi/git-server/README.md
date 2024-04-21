# README

Gitea is a git server.  

NOTE:

* It does not handle RSA ssh keys less than 3072Kb.  

## Start

```sh
cd 19_yubi/git-server

docker compose up

open http://localhost:3000/
```

## Test

* Create a new user (or set admin) `chrisguest`
* Initialise a repo "gitea_testing"
* Add an ssh key for the user.

```sh
# outside of a git tree
mkdir gitea_testing 

touch README.md
git init
git checkout -b main
git add README.md
git commit -m "first commit"

git remote add origin http://localhost:3000/chrisguest/gitea_testing.git
git remote remove origin  
git remote add origin git@localhost:222:chrisguest/gitea_testing.git

# quick test connect - it will print out identity and disconnect.  
ssh -p 222 git@localhost 

git push -u origin main
```

## Cleanup

```sh
docker compose down
```

## Resources

* Installation with Docker [here](https://docs.gitea.com/installation/install-with-docker)  
