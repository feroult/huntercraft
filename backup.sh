#!/bin/bash -x

TIME=$(date "+%Y%m%d-%H%M%S")
TEMP_DIR="/tmp/minecraft_backup"
SCREEN_OUTPUT="$TEMP_DIR/minecraft-screen.txt"
BACKUP_FILE="$TEMP_DIR/minecraft-backup.zip"

rm -rf $TEMP_DIR
mkdir -p $TEMP_DIR

backup() {    
    cd $MINECRAFT_HOME
    cd ..
    FOLDER=$(basename $MINECRAFT_HOME)
    zip -r $BACKUP_FILE $FOLDER
    gsutil -m cp -R $BACKUP_FILE $MINECRAFT_BUCKET/minecraft-$TIME.zip
}

screen -r mcs -X stuff "save-all\nsave-off\nsay backup-$TIME\n"

# waits for world to be saved
screen -r mcs -X hardcopy $SCREEN_OUTPUT
while [ -z "$(grep backup-$TIME $SCREEN_OUTPUT)" ]; do
    sleep 1
    screen -r mcs -X hardcopy $SCREEN_OUTPUT
done

backup

screen -r mcs -X stuff "save-on\nsay backup-done-$TIME\n"

# waits to backup finish
screen -r mcs -X hardcopy $SCREEN_OUTPUT
while [ -z "$(grep backup-done-$TIME $SCREEN_OUTPUT)" ]; do
    sleep 1
    screen -r mcs -X hardcopy $SCREEN_OUTPUT
done

echo "Backup success!"