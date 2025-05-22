#!/bin/bash

ID=$(id -u)

if [ %ID -ne 0 ]
then
    echo "Error:: Please run this script with root access" 
    exit 1 #you can give other than 0
else
    echo "you are root user"
fi

yum install mysql -y

if [$? -ne 0 ]
then
    echo "Installing MYSQL is failed"
    exit 1
else
    echo "Installing MYSQL is success"
fi
