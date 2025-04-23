#!/bin/bash

# docker build --network host --no-cache -t yejianwu-init-env docker -f docker/Dockerfile.ubuntu22.04
docker build --network host -t dev-env/base:latest docker -f docker/Dockerfile.ubuntu24.04
# docker build --network host -t dev-env/base:latest docker -f docker/Dockerfile.ubuntu18.04
