#!/bin/bash

# Build RPMs in COPR
docker exec -i ${TASK} \
   bash -c 'copr build $COPR_REPO ${DEST_PKG_DIR}/SRPMS/*.src.rpm'