#!/bin/bash

docker run -it --rm --privileged=true \
  -d --name yejw-dev \
  -v $HOME:$HOME \
  -v /dev:/dev \
  -v $PWD:$PWD -w $HOME \
  --detach-keys='ctrl-q,q' \
  --ulimit core=-1 --security-opt seccomp=unconfined \
  --net host \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/bin/docker:/usr/bin/docker \
  dev-env/base:latest \
  sh -c "cp -rf $HOME/.config/github-copilot/ /root/.config/github-copilot/ && \
  cp -rf $HOME/.gitconfig /root/.gitconfig && zsh"
