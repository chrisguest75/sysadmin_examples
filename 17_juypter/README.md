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
docker build -t juypter .

# run
docker run --rm -p 8888:8888 juypter   

# open docker notebook
open http://localhost:8888/notebooks/First%20Notebook.ipynb#
```

## Resources

* Jupyter Notebook: An Introduction [here](https://realpython.com/jupyter-notebook-introduction/)
