# SCANNING FOR PASSWORDS

TODO:

* I want to check the only secrets that make it into a build - go through env file and scan for particular secrets
* It doesn't seem to scan at the moment

## Trufflehog

Open [.pre-commit-config.yaml](../.pre-commit-config.yaml).  

```sh
brew install trufflehog

trufflehog filesystem ./
```

## Precommit

Adding a hook.  

```sh
# install pre-commmit (prerequisite for commitizen)
brew install pre-commit
brew install commitizen

# install hooks
pre-commit install --hook-type commit-msg --hook-type pre-push
```

## Resources

* Trufflehog - Find leaked credentials. [here](https://github.com/trufflesecurity/trufflehog)
* Pre-commit hooks [here](https://docs.trufflesecurity.com/pre-commit-hooks)
* Yelp detect-secrets [here](https://github.com/Yelp/detect-secrets)
