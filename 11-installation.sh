#!/bin/bash
USER_ID=$(id -u)

if [ $USER_ID -ne 0 ];then
    echo "please the run the script with root user"
    exit 1
fi 
echo "Installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "Installing the nginx ..FALIURE"
    exit 1
else
    echo "Installing the nginx...sucess"
fi


dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Installing the mysql..FALIURE"
    exit 1
else
    echo "Installing the mysql..SUCCESS"
fi 

dnf install nodejs -y

if [ $? -ne 0]; then 
    echo "Installing the nodejs...FALIURE"
    exit 1
else 
    echo "Installing the nodejs...SUCESS"
fi