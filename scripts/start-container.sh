#!/usr/bin/env bash

GREEN=`tput setaf 2`
RED=`tput setaf 5`
RESET=`tput sgr0`

if [[ ! $(docker container ls -a --filter "name=^hpb$" --format "{{.Names}}") == "hpb" ]]; then
    echo "${RED}Container does not exist. Cannot start non-existing container.${RESET}"

else
    echo "${GREEN}Container exists. Can go on.${RESET}"

    if [[ ! $(docker ps  -a --filter "name=^hpb$" --filter status=running --filter status=paused --format "{{.Names}}") == "hpb" ]]; then
        echo "${GREEN}Container is not running. Will start the container now${RESET}"

        (
            set -x;
            docker start hpb
        )

        docker ps  -a --filter "name=^hpb$"
    else
        echo "${RED}Container is somehow alive. Please fix this.${RESET}"

        docker ps  -a --filter "name=^hpb$"
    fi
fi
