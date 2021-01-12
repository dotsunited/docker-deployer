docker-deployer
===============

A minimal Alpine Linux Docker image with the latest
[deployer](https://deployer.org) and its additional
[recipes](https://github.com/deployphp/recipes) suited for automated deployments
via Continuous Delivery systems like GitLab Pipelines.

Automatically build upon pushes to the master branch:
https://hub.docker.com/r/dotsunited/deployer

Usage
-----

### GitLab Pipelines

Example `.gitlab-ci.yml` configuration:

```
before_script:
  - eval $(ssh-agent -s)
  - ssh-add <(echo "$SSH_PRIVATE_KEY")
  - mkdir -p ~/.ssh
  - chmod 700 ~/.ssh
  - echo "$SSH_KNOWN_HOSTS" > ~/.ssh/known_hosts
  - chmod 644 ~/.ssh/known_hosts

deploy_production:
  image: dotsunited/deployer
  stage: deploy
  environment:
    name: production
    url: https://example.com
  only:
    - master
  script:
    - dep deploy production -vvv
```

Make sure, you configure the `$SSH_PRIVATE_KEY` and `$SSH_KNOWN_HOSTS` variables
in the CI/CD settings on GitLab.

For more info, read
[Using SSH keys with GitLab CI/CD](https://docs.gitlab.com/ee/ci/ssh_keys/README.html).

### Docker

```bash
docker run \
    --tty \
    --interactive \
    --rm \
    --volume ~/.ssh:/root/.ssh \
    --volume ~/.composer/cache/files:/root/.composer/cache/files \
    --volume $(pwd):/deployer \
    dotsunited/deployer dep deploy staging
```

License
-------

Copyright (c) 2017-2021 Dots United GmbH.
Released under the [MIT](LICENSE) license.
