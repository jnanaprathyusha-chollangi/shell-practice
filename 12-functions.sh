#!bin/bash

USER_ID=$(id -u)
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
dnf install nginx -y
VALIDATE $? "Installing Nginx"

dnf install mysql -y
VALIDATE $? "Instaling Mysql"

dnf install nodejs -y
VALIDATE $? "Installing nodejs"