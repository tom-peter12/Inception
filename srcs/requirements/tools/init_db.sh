#!/bin/bash
# if [ ! -d "/home/${USER}/data" ]
# then
#         mkdir -p /home/${USER}/data/db
#         mkdir -p /home/${USER}/data/wp
# fi

if [ ! -d "/home/${USER}/data" ]
then
        mkdir -p /home/${USER}/data/db
        mkdir -p /home/${USER}/data/wp
        chown -R ${USER}:${USER} /home/${USER}/data/db
        chown -R ${USER}:${USER} /home/${USER}/data/wp
fi