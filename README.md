# docker-deployer

A minimal Alpine Linux docker image with the latest git-ftp suited for automated deployments via Continuous Delivery systems like GitLab Pipelines.

Automatically build upon pushes to the master branch: https://hub.docker.com/r/dotsunited/docker-deployer

## Usage
Example .gitlab-ci.yml configuration:

```
before_script:
  - deployer-ssh-setup

deploy:
  image: dotsunited/deployer:{VERSION}
  script:
  - dep deploy --file=$CI_PROJECT_DIR/deploy.php {PARAMETERS}
  stage: deploy
```
This image is not usable with docker-cli directly!

## License
Copyright (c) 2018 Dots United GmbH. Released under the MIT license.