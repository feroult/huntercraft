#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pidof java >/dev/null
if [[ $? -ne 0 ]] ; then    
    echo "Restarting Spigot: $(date)" 
    screen -wipe mcs || true
    $DIR/start.sh
fi