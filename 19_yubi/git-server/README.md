# README

Gitea is a git server.  

## Start

```sh
cd 19_yubi/git-server

docker compose up

open http://localhost:3000/
```

## Test

* Create a new user (or set admin)
* Initialise a repo

```sh
touch README.md
git init
git checkout -b main
git add README.md
git commit -m "first commit"
git remote add origin http://localhost:3000/gittest/anothertest.git
git push -u origin main
```

## Cleanup

```sh
docker compose down
```

## Resources

* Installation with Docker [here](https://docs.gitea.com/installation/install-with-docker)  
