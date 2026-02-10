#!/bin/bash
USER_ID=$(id -u)

if [ USER_ID -ne 0 ]; then
    echo "please the run the script with root user"
    exit 1
fi 
echo "Installing NGINX"
dnf install nginx -y

if [ $? -ne 0 ]; then 
    echo "Installing the nginx ..FALIURE"
elif 
    echo "Installing the nginx...sucess"
fi