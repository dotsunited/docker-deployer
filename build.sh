#!/usr/bin/env bash
set -euxo pipefail

docker build --platform=linux/amd64 -t dotsunited/deployer:1 ./1
docker push dotsunited/deployer:1

docker build --platform=linux/amd64 -t dotsunited/deployer:2 ./2
docker push dotsunited/deployer:2

docker build --platform=linux/amd64 -t dotsunited/deployer:3 ./3
docker push dotsunited/deployer:3

docker tag dotsunited/deployer:3 dotsunited/deployer:latest
docker push dotsunited/deployer:latest
