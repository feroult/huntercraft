#!/bin/bash -x

screen -r mcs -X stuff "stop\n"
crontab -r