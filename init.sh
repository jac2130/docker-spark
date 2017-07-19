#!/bin/bash

# use the argument as the branch
export BRANCH=$1
if [[ -z $BRANCH ]]; then
    export BRANCH=$(git rev-parse --abbrev-ref HEAD)
fi

echo "DEPLOYING WITH BRANCH: $BRANCH"

# rebuild container
docker build . -t docker-spark/main

# clean up exited containers
docker rm $(docker ps -q -f status=exited -f status=created)

echo "DEPLOYING WITH BRANCH: $BRANCH"

# initialize container
docker-compose up
