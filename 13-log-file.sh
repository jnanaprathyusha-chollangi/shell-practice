#!/bin/bash

USER_ID=$(id -u)
LOG_FLODER="/var/log/shell-script"
LOG_FILE="/var/log/shell-script/$0.log"
if [ $USER_ID -ne 0 ] ; then
    echo "please run this script with root user access"
    exit 1 
fi 
VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo "$2...FALIURE"
        exit 1 
    else 
        echo "$2...SUCCESS"
    fi
}
dnf install nginx -y &>> $LOG_FILE
VALIDATE $? "Installing Nginx"

dnf install mysql -y &>> $LOG_FILE
VALIDATE $? "Instaling Mysql"

dnf install nodejs -y &>> $LOG_FILE
VALIDATE $? "Installing nodejs"