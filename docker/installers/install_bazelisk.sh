#!/bin/bash

set -e

# Install packages
apt-get install --no-install-recommends -y \
  openjdk-8-jdk \
  openjdk-8-jre-headless

# Install the most recent bazel release.
BAZELISK_VERSION=v1.12.0
INSTALL_ROOT_DIR=/opt/bazelisk
# From https://github.com/bazelbuild/bazelisk/releases/download/v1.10.1/bazelisk-linux-amd64
wget -c https://github.com/bazelbuild/bazelisk/releases/download/$BAZELISK_VERSION/bazelisk-linux-amd64
chmod +x bazelisk-linux-amd64
mkdir -p $INSTALL_ROOT_DIR
mv bazelisk-linux-amd64 $INSTALL_ROOT_DIR
ln -s $INSTALL_ROOT_DIR/bazelisk-linux-amd64 $INSTALL_ROOT_DIR/bazelisk
