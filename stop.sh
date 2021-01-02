#!/bin/bash -x

ps -ef | grep spigot.jar | awk '{ print $2 }' | xargs kill -9
crontab -r