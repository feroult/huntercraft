#!/bin/bash

MINECRAFT_HOME=/home/op/minecraft

pidof java >/dev/null
if [[ $? -ne 0 ]] ; then
    echo "Restarting Spigot:     $(date)" >> /home/lucas/respawn.log
    cd $MINECRAFT_HOME
    ./start.sh
fi