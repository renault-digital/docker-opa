# opa

[![Build Status](https://travis-ci.com/renault-digital/docker-opa.svg?branch=master)](https://travis-ci.com/renault-digital/docker-opa)

Auto-trigger docker build for [open policy agent](https://www.openpolicyagent.org/) when new release is announced. This image enables usage with gitlab-ci

[![DockerHub Badge](http://dockeri.co/image/renaultdigital/opa)](https://hub.docker.com/r/renaultdigital/opa/)

## NOTES

The latest docker tag is the latest release version (https://github.com/open-policy-agent/opa/releases/latest)

Please avoid to use `latest` tag for any production deployment. Tag with right version is the proper way, such as `renaultdigital/opa:v0.23.2`

### Github Repo

https://github.com/renault-digital/docker-opa

### Daily Travis CI build logs

https://travis-ci.org/renault-digital/opa

### Docker image tags

https://hub.docker.com/r/renaultdigital/opa/tags/

# Usage

    # mount local folders in container.
    docker run -ti --rm -v $(pwd):/apps -w /apps \
        renaultdigital/opa

    # Run opa with special version. The tag is opa's version
    docker run -ti --rm -v $(pwd):/apps -w /apps \
        renaultdigital/opa:v0.23.2

    # run container as command
    alias opa="docker run -ti --rm -v $(pwd):/apps -w /apps \
        renaultdigital/opa"
    opa --help
    
    # example in ~/.bash_profile
    alias opa='docker run -ti --rm -v $(pwd):/apps -w /apps \
        renaultdigital/opa'

# Why we need it

Mostly it is used during CI/CD (continuous integration and continuous delivery) or as part of an automated build/deployment

# The Processes to build this image

* Enable Travis CI cronjob on this repo to run build daily on master branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with release version and push to https://hub.docker.com/
* Get the latest version from https://github.com/opa/opa/releases/latest, pull the image with that version, tag as `renaultdigital/opa:latest` and push to hub.docker.com

# Contribution

Before any contribution, test your code :

- using our testing script: `.githooks/pre-commit`
- by registering our githooks: `git config --local core.hooksPath .githooks/`
