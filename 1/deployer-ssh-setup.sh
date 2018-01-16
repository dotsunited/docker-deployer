#!/usr/bin/env bash
set -e

if [ "$SSH_PRIVATE_KEY" != "" ]; then
    echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add - > /dev/null
fi

# For Docker builds disable host key checking. Be aware that by adding that
# you are susceptible to man-in-the-middle attacks.
# WARNING: Use this only with the Docker executor, if you use it with shell
# you will overwrite your user's SSH config.
if [ -f "/.dockerenv" ]; then
    mkdir -p ~/.ssh
    echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> ~/.ssh/config
fi

exec "$@"
