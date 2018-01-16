#!/usr/bin/env bash
set -e

if [ "$SSH_PRIVATE_KEY" != "" ]; then
    eval $(ssh-agent -s)
fi

exec "$@"
