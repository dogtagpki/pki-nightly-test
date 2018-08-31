#!/bin/bash

display_usage() {
	echo -e "Usage:\n./buildCOPR SCRIPT [arguments]"
}

if [ $# -lt 1 ]; then
    echo "Error: Pass build script name" >> /dev/stderr
    display_usage
    exit 1
fi

# Build src rpm from cloned repo
BUILD_SCRIPT=${1}
shift
ARGUMENTS=$@

echo "Build script being executed: "${BUILD_SCRIPT}
echo "Arguments passed to build script: "${ARGUMENTS}
docker exec -i ${TASK} \
    ${BUILD_SCRIPT} ${ARGUMENTS}

# # Build RPMs in COPR
docker exec -i ${TASK} \
   bash -c 'copr build $COPR_REPO ${DEST_PKG_DIR}/SRPMS/*.src.rpm'