#!/usr/bin/env bash

GREEN=`tput setaf 2`
RED=`tput setaf 5`
RESET=`tput sgr0`

if [[ $(docker container ls -a --filter "name=^hpb$" --format "{{.Names}}") == "hpb" ]]; then
    echo "${RED}Container already exists. Remove it first before recreating it.${RESET}"
else
    echo "${GREEN}Container does not exist. Will create container now for you.${RESET}"

    (
        set -x;
        docker create \
           --mount type=bind,src=${PWD},dst=/srv/jekyll \
           --publish 4000:4000 \
           -t -i \
           --name hpb \
           freiheitsgrade-homepage:latest bash
    )
fi
