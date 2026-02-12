#!/bin/bash

USER_ID=$(id -u)
if [ $USER_ID -ne 0 ] ; then
    echo "please run this script with root user access" &>>$LOG_FILE
    exit 1 
fi 
VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo "$2...FALIURE" &>>$LOG_FILE
        exit 1 
    else 
        echo "$2...SUCCESS" &>>LOG_FILE
    fi
}
for i in $@ #sudo sh 15-loop.sh nginx mysql nodejs
do 
    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "$package Installing"
done
# dnf install nginx -y
# VALIDATE $? "Installing Nginx"

# dnf install mysql -y
# VALIDATE $? "Instaling Mysql"

# dnf install nodejs -y
# VALIDATE $? "Installing nodejs"