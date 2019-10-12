#!/usr/bin/env bash

GREEN=`tput setaf 2`
RED=`tput setaf 5`
RESET=`tput sgr0`

if [[ ! -z $(docker images  -q freiheitsgrade-homepage:latest) ]]; then
    echo "${RED}Image already exists. Remove it first before recreating it.${RESET}"
else
    echo "${GREEN}Images does not exist. Will create image now for you.${RESET}"

    (
        set -x;
        docker build --tag freiheitsgrade-homepage:latest .
    )
fi
