#!/bin/bash

set -x

docker exec -it --detach-keys='ctrl-q,q' yejw-dev zsh

set +x
