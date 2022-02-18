# README

Demonstrate how to get a `jupyter` server running  

TODO:  

* ```jupyter nbconvert First\ Notebook.ipynb --to pdf```
* ```jupyter nbextension install EXTENSION_NAME```

## Setting up with pipenv and pyenv

```sh
export PIPENV_VENV_IN_PROJECT=1
pyenv install --list
pyenv install 3.9.2
pyenv local 3.9.2

# or use pipenv to create virtual env.  
pipenv install --python $(pyenv which python)        

#pipenv --rm
# switching into venv 
pipenv shell
# or
source ./.venv/bin/activate

# after adding packages
pipenv lock -r > requirements.txt  
```

## Install

```sh
pipenv install jupyter
```

## Run

```sh
# run the server
jupyter notebook

# open the notebook
open http://localhost:8888/notebooks/First%20Notebook.ipynb#
```

## Build

```sh
# build
docker build --no-cache -t jupyter .

# run
docker run -d --name jupyter --rm -p 8888:8888 jupyter   

# get the token 
docker logs jupyter

# open docker notebook
open http://localhost:8888/notebooks/First%20Notebook.ipynb#

# stop 
docker stop jupyter

# debug
docker run --rm -d --name jupyter --entrypoint "/bin/bash" --rm -p 8888:8888 jupyter -c 'sleep 10000'
docker exec -u root -it jupyter /bin/bash   
docker stop jupyter   
```

## Add a kernel (csharp)

```sh
# add csharp
docker build --no-cache -t jupytercsharp -f Dockerfile.csharp .
docker run --name jupytercsharp --rm -d -p 8888:8888 jupytercsharp  

# get the token 
docker logs jupytercsharp

# stop 
docker stop jupytercsharp

docker run --rm -it --name jupytercsharp --entrypoint "/bin/bash" -p 8888:8888 jupytercsharp
```

## Add a kernel (powershell)

```sh
# add powershell
docker build --no-cache -t jupyterpowershell -f Dockerfile.powershell .
docker run --name jupyterpowershell --rm -p 8888:8888 jupyterpowershell   

# debug
docker run --rm -d --name jupyterpowershell --entrypoint "/bin/bash" --rm -p 8888:8888 jupyterpowershell -c 'sleep 10000'
docker exec -u root -it jupyterpowershell /bin/bash 

docker stop jupyterpowershell  
```

```sh
# ubuntu
docker run --rm -d --name ubuntu --entrypoint "/bin/bash" --rm -p 8888:8888 ubuntu:20.04 -c 'sleep 10000'
docker exec -u root -it ubuntu /bin/bash 
apt-get update
```

## Resources

https://jupyter-notebook.readthedocs.io/en/stable/notebook.html
* Jupyter Notebook: An Introduction [here](https://realpython.com/jupyter-notebook-introduction/)

https://blog.darrenjrobinson.com/docker-powershell-jupyter-notebook-environments/


https://blog.darrenjrobinson.com/getting-started-with-local-powershell-jupyter-notebook/

https://github.com/tlinnet/csharp-notebook/blob/master/travis-ci/Dockerfile_build


https://pkgs.dev.azure.com/dnceng/9ee6d478-d288-47f7-aacc-f6e6d082ae6d/_packaging/d1622942-d16f-48e5-bc83-96f4539e7601/nuget/v3/flat2/microsoft.dotnet-interactive/index.json


https://github.com/darrenjrobinson/pwsh-jupyter-notebook/blob/master/Dockerfile


https://github.com/dotnet/interactive/blob/main/docs/install-dotnet-interactive.md

https://github.com/dotnet/interactive/issues/832
