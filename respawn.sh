#!/bin/bash

pidof java >/dev/null
if [[ $? -ne 0 ]] ; then    
    echo "Restarting Spigot: $(date)" >> /tmp/respawn.log
    screen -wipe mcs || true
    cd $MINECRAFT_HOME >> /tmp/respawn.log
    echo "here" >> /tmp/respawn.log
    ./start.sh >> /tmp/respawn.log
fi