#!/bin/bash

# Build RPMs in COPR
docker exec -i ${TASK} \
   bash -c 'copr build $TEST_COPR_REPO ${DEST_PKG_DIR}/SRPMS/*.src.rpm'
