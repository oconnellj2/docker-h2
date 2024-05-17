#!/bin/sh

# build version 2.2.224 / latest
BUILD_VERSION=2.2.224

# Ensure Docker CLI experimental features are enabled
export DOCKER_CLI_EXPERIMENTAL=enabled

# Create a new builder instance using Docker Buildx and set containerd as the driver
docker buildx create --use --driver docker-container

# Build your image using Docker Buildx
docker buildx build --push --build-arg H2_VERSION=$BUILD_VERSION --tag jdoconnell/h2:1.0.0 --tag jdoconnell/h2:latest --platform=linux/amd64,linux/arm64 .
