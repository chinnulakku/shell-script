#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "Error:: Please run this script with root access" 
    exit 1 #you can give other than 0
else
    echo "you are root user"
fi

yum install mysql -y

if [$? -ne 0 ]
then
    echo "ERROR:: Installing MYSQL is failed"
    exit 1
else
    echo "Installing MYSQL is success"
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Intalling git is failed"
    exit 1
else   
    echo "Istalling git is success"
fi
