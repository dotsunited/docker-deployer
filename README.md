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
## License
Copyright (c) 2018 Dots United GmbH. Released under the MIT license.