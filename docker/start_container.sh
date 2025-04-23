#!/bin/bash

# docker run -it --rm --privileged=true \
#   -d --name yejw-dev \
#   -v ~/.config/github-copilot/:/root/.config/github-copilot/ \
#   -v $HOME:$HOME \
#   -u $UID -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro \
#   -v /dev:/dev \
#   -v $PWD:$PWD -w $PWD \
#   --detach-keys='ctrl-q,q' \
#   --ulimit core=-1 --security-opt seccomp=unconfined \
#   --net host \
#   -v /var/run/docker.sock:/var/run/docker.sock \
#   -v /usr/bin/docker:/usr/bin/docker \
#   dev-env/base:latest zsh

docker run -it --rm --privileged=true \
  -d --name yejw-dev \
  -v ~/.config/github-copilot/:/root/.config/github-copilot/ \
  -v $HOME:$HOME \
  -v /dev:/dev \
  -v $PWD:$PWD -w $HOME \
  --detach-keys='ctrl-q,q' \
  --ulimit core=-1 --security-opt seccomp=unconfined \
  --net host \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/bin/docker:/usr/bin/docker \
  dev-env/base:latest zsh
