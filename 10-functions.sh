#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [$? -ne 0 ]
    then
        echo "ERROR:: $2 ... failed"
        exit 1
    else
        echo "$2 ... success"
    fi
}

if [ $ID -ne 0 ]
then
    echo "Error:: Please run this script with root access" 
    exit 1 #you can give other than 0
else
    echo "you are root user"
fi # fi means reverse of if, indcating condition end

yum install mysql -y

VALIDATE $? "Installing MYSQL"

yum install git -y

VALIDATE $? "Installing GIT"
