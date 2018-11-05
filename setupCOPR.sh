#!/bin/bash

if [ "$COPR_API" == "" ]; then
    echo "ERROR: COPR_API environment variable undefined"
    echo "NOTE: Travis won't inject Secure variables in Pull Request"
    exit 1
fi

docker exec -it ${TASK} bash -c 'mkdir -p ~/.config/ && echo -e ${COPR_API} > ~/.config/copr'
docker exec -it ${TASK} git clone ${GITHUB_REPO}
