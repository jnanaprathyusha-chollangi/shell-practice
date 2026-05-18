#!/bin/bash

USERID=$(id -u)
LOGS_DIR="/var/log/shell-script"
LOGS_FILE="$LOGS_DIR/backup.log"
SOURCE_DIR=$1
DEST_DIR=$2
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

log(){
    echo -e "$(date "+%Y-%m-%d %H:%M:%S") | $1" | tee -a $LOGS_FILE
}




if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then 
    echo -e "$R $SOURCE_DIR does not exit $N"
    exit 1
fi 

if [ ! -d $DEST_DIR ]; then 
    echo -e "$R $DEST_DIR does not exit $N"
    exit 1 
fi 

### find the files

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Backup started"
log "Source Directory: $SOURCE_DIR"
log "Destination Directory: $DEST_DIR"
log "Days: $DAYS"
 

 if [ -z "${FILES}" ]; then 
    log "No file is archieve...$Y Skipping $N"
else 
    #app-logs-$timestamp.Zip
    log "Files found to archieve: $FILES"
    TIMESTAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
    echo "Archieve name: $ZIP_FILE_NAME"
    tar -zcvf $ZIP_FILE_NAME $(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

    #check archieve is success or not 
    if [ -f $ZIP_FILE_NAME ]; then
        log "Archeival is ....$G SUCCESS $N"

        #Delete the files...
        while IFS= read -r filepath; do
        # process each line here
        log "Deleting file: $filepath"
        rm -f $filepath
        log "Deleted file: $filepath"
        done <<< $FILES
    else
        log "Archeival is not $R FAILURE $N"
        exit 1 
    fi


    
fi