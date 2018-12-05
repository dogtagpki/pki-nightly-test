#!/bin/bash

# Build RPMs in COPR

# For Nuxwdog, skip building in Rawhide due to bug in `Keyutils`
# BZ: https://bugzilla.redhat.com/show_bug.cgi?id=1629878
if [ $TASK = "nuxwdog" ]; then
    docker exec -i ${TASK} \
        bash -c 'copr build $TEST_COPR_REPO ${DEST_PKG_DIR}/SRPMS/*.src.rpm --chroot fedora-28-x86_64 --chroot fedora-29-x86_64'
else
    docker exec -i ${TASK} \
        bash -c 'copr build $TEST_COPR_REPO ${DEST_PKG_DIR}/SRPMS/*.src.rpm'
fi
