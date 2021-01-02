#!/bin/bash -x

GSUTIL=/usr/bin/gsutil

TIME=$(date "+%Y%m%d-%H%M%S")
TEMP_DIR="/tmp/minecraft_backup"
SCREEN_OUTPUT="$TEMP_DIR/minecraft-screen.txt"
BACKUP_FILE="$TEMP_DIR/minecraft-backup.zip"

mkdir -p $TEMP_DIR

backup() {
    zip -r $BACKUP_FILE $MINECRAFT_HOME
    gsutil -m cp -R $MINECRAFT_HOME gs://$MINECRAFT_BUCKET/minecraft-$TIME.zip
}

screen -r mcs -X stuff "save-all\nsave-off\nsay backup-$TIME\n"

screen -r mcs -X hardcopy $SCREEN_OUTPUT
while [ -z "$(grep backup-$TIME $SCREEN_OUTPUT)" ]; do
    sleep 1
    screen -r mcs -X hardcopy $SCREEN_OUTPUT
done

backup

screen -r mcs -X stuff "save-on\n"
