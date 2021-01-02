#!/bin/bash

pidof java >/dev/null
if [[ $? -ne 0 ]] ; then    
    echo "Restarting Spigot: $(date)" > $MINECRAFT_HOME/respawn.log
    screen -wipe mcs
    cd $MINECRAFT_HOME
    ./start.sh
fi