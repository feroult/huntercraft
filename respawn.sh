#!/bin/bash

pidof java >/dev/null
if [[ $? -ne 0 ]] ; then    
    echo "Restarting Spigot: $(date)" >> /tmp/respawn.log
    screen -wipe mcs >> /tmp/respawn.log
    cd $MINECRAFT_HOME >> /tmp/respawn.log
    ./start.sh >> /tmp/respawn.log
fi