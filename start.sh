#!/bin/bash -x

start() {
    screen -S mcs java -Xms1G -Xmx3G -d64 -jar server.jar nogui
}

(cd $MINECRAFT_HOME && start)