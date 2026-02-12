#!/bin/bash

USER_ID=$(id -u)
LOG_FLODER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"

if [ $USER_ID -ne 0 ] ; then
    echo "please run this script with root user access" | tee -a $LOG_FILE
    exit 1 
fi 
mkdir -p $LOG_FLODER

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo "$2...FALIURE" | tee -a $LOG_FILE
        exit 1 
    else 
        echo "$2...SUCCESS" | tee -a $LOG_FILE
    fi
}
for package in $@ #sudo sh 15-loop.sh nginx mysql nodejs
do 
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package Installing"
    else
        echo "$package already installed,skipping"
    fi
done