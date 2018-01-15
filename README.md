# docker-deployer

A minimal Alpine Linux docker image with the latest git-ftp suited for automated deployments via Continuous Delivery systems like GitLab Pipelines.

Automatically build upon pushes to the master branch: https://hub.docker.com/r/dotsunited/docker-deployer

## Usage
Example .gitlab-ci.yml configuration:

```
deploy:
    image: dotsunited/docker-deployer
    stage: deploy
    only:
        - master
    script:
        - deploy
```
Example console (with SSH-Password):
```
docker run \ 
    -v ~/.ssh:/home/deployer-user/.ssh \ 
    -v $(pwd):/home/deployer-user --user deployer-user:deployer-user \ 
    --tty \
    --interactive \ 
    --rm \
    dotsunited/docker-deployer {PARAMETER}
```
Example console (without SSH-Password):
```
docker run \ 
    -v ~/.ssh:/home/deployer-user/.ssh \ 
    -v $(pwd):/home/deployer-user --user deployer-user:deployer-user \ 
    --rm \
    dotsunited/docker-deployer {PARAMETER}
```
## License
Copyright (c) 2018 Dots United GmbH. Released under the MIT license.