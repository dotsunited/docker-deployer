#!/usr/bin/env bash
set -euxo pipefail

docker build -t dotsunited/deployer:1 ./1
docker push dotsunited/deployer:1

docker build -t dotsunited/deployer:2 ./2
docker push dotsunited/deployer:2

docker tag dotsunited/deployer:2 dotsunited/deployer:latest
docker push dotsunited/deployer:latest
