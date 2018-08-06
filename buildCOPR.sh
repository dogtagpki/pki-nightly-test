#!/bin/bash

# Build src rpm from cloned repo
docker exec -i ${TASK} \
    /pki/build.sh \
    --with-timestamp \
    --with-commit-id \
    --work-dir=/packages srpm

# Build RPMs in COPR
docker exec -i ${TASK} \
    bash -c 'copr build $COPR_REPO /packages/SRPMS/*.src.rpm'