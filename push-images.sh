#!/bin/bash

set -euxo pipefail

# login to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# push latest amd64, arm32v7 and arm64v8 images
docker push "sebastianalbers/tor:latest-amd64"
docker push "sebastianalbers/tor:latest-arm32v7"
docker push "sebastianalbers/tor:latest-arm64v8"

# read version from Docker container
version=$(./read-version.sh amd64)

# push multi-arch image
./push-multi-arch-image.sh "${version}"

