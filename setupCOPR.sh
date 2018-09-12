#!/bin/bash

docker exec -it ${TASK} bash -c 'mkdir -p ~/.config/ && echo -e ${COPR_API} > ~/.config/copr'
docker exec -it ${TASK} git clone ${GITHUB_REPO}