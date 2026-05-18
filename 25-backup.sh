#!/bin/bash

USERID=$(id -u)
LOGS_DIR="/var/log/shell-script"
LOGS_FILE="$LOGS_DIR/backup.log"
SOURCE_DIR=
DEST_DIR=
DAYS=${3:-14} # 14 days is the default value, if the user not give 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOGS_DIR

if [ $USERID -ne 0 ]; then
    echo -e "$R Please run the script with root access $N" | tee -a $LOGS_FILE
    exit 1
fi

USAGE() {
    echo -e "$R USAGE:: sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi

if [ -d $SOURCE_DIR ]; then 
    echo "$R $source_DIR does not exit $N"
    exit 1
fi 

if [ -d $DEST_DIR ]; then 
    echo "$R $DEST_DIR does not exit $N"
    exit 1 
fi 
 