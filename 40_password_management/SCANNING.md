# SCANNING FOR PASSWORDS

TODO:

* I want to check the only secrets that make it into a build

## Trufflehog

Open [.pre-commit-config.yaml](../.pre-commit-config.yaml).  

```sh
brew install trufflehog


trufflehog filesystem ./

```

## Resources

* Trufflehog - Find leaked credentials. [here](https://github.com/trufflesecurity/trufflehog)
* Yelp detect-secrets [here](https://github.com/Yelp/detect-secrets)
