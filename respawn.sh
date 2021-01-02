#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

pidof java >/dev/null
if [[ $? -ne 0 ]] ; then    
    echo "Restarting spigot..."
    screen -wipe mcs || true
    $DIR/start.sh
else
    echo "Spigot already running."
fi