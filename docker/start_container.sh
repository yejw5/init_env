#!/bin/bash

set -x

docker run --rm --init -it -d \
  --name yejw-dev \
  --net host \
  --detach-keys='ctrl-q,q' \
  -v `pwd`:`pwd` \
  -v $HOME:$HOME \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/bin/docker:/usr/bin/docker \
  dev-env/base:latest zsh

set +x
