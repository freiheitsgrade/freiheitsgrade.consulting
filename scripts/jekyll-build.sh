#!/usr/bin/env bash

GREEN=`tput setaf 2`
RED=`tput setaf 5`
RESET=`tput sgr0`

if [[ ! $(docker container ls -a --filter "name=^hpb$" --format "{{.Names}}") == "hpb" ]]; then
    echo "${RED}Container does not exist. Cannot stop non-existing container.${RESET}"

else
    echo "${GREEN}Container exists. Can go on.${RESET}"

    if [[ ! $(docker ps  -a --filter "name=^hpb$" --filter status=running --filter status=paused --format "{{.Names}}") == "hpb" ]]; then
        echo "${RED}Container is not alive.${RESET}"

    else
        echo "${RED}Container is somehow alive. Going to stop it.${RESET}"

        (
            set -x;
            docker exec hpb bundle exec jekyll build
        )
    fi
fi
