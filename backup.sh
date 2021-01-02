#!/bin/bash

GSUTIL=/usr/bin/gsutil

TIME=$(date "+%Y%m%d-%H%M%S")

backup() {
    zip -r /tmp/minecraft-backup.zip $MINECRAFT_HOME
    gsutil -m cp -R $MINECRAFT_HOME gs://$MINECRAFT_BUCKET/minecraft-$TIME.zip
}

screen -r mcs -X stuff '/save-all\n/save-off\n'
backup
screen -r mcs -X stuff '/save-on\n'
