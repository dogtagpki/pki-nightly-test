#!/bin/bash

docker exec -it ${TASK} dnf install -y git dnf-plugins-core rpm-build copr-cli
docker exec -it ${TASK} dnf copr enable -y ${COPR_REPO}
docker exec -it ${TASK} dnf -y update
