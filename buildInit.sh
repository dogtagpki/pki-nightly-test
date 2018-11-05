#!/bin/bash

# Pull the corresponding Fedora image
docker pull ${IMAGE}

# Start the container
docker run \
    --detach \
    --name=${TASK} \
    --privileged \
    -e BUILDUSER_UID=$(id -u) \
    -e BUILDUSER_GID=$(id -g) \
    -e COPR_API="${COPR_API}" \
    -e TEST_COPR_REPO="${TEST_COPR_REPO}" \
    -e DEST_PKG_DIR="${DEST_PKG_DIR}" \
    -e TRAVIS=${TRAVIS} \
    -e TRAVIS_JOB_NUMBER=${TRAVIS_JOB_NUMBER} \
    -v $(pwd):/tmp \
    -ti \
    ${IMAGE}