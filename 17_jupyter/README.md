# README

Demonstrate how to get a juypter server running  

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
docker build --no-cache -t juypter .

# run
docker run -d --name juypter --rm -p 8888:8888 juypter   

# open docker notebook
open http://localhost:8888/notebooks/First%20Notebook.ipynb#

# debug
docker run --rm -d --name juypter --entrypoint "/bin/bash" --rm -p 8888:8888 juypter -c 'sleep 10000'
docker exec -u root -it juypter /bin/bash   
docker stop juypter   
```

## Add a kernel

```sh
# add powershell
docker build --no-cache -t juypterpowershell -f Dockerfile.powershell .
docker run --name juypterpowershell --rm -p 8888:8888 juypterpowershell   

# debug
docker run --rm -d --name juypterpowershell --entrypoint "/bin/bash" --rm -p 8888:8888 juypterpowershell -c 'sleep 10000'
docker exec -u root -it juypterpowershell /bin/bash 

docker stop juypterpowershell  
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


