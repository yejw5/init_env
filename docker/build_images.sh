#!/bin/bash

# docker build --network host --no-cache -t yejianwu-init-env docker -f docker/Dockerfile.ubuntu20.04
docker build --network host -t dev-env/base:latest docker -f docker/Dockerfile.ubuntu20.04
