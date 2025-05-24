#!/bin/bash

ID=$(id -u)
R="\e[31m"]
G="\e[32m"]
Y="\e[33m"]
N="\e[0m"]

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    IF [ $1 -ne 0 ]
       echo -e "$2 ...$R FAILED $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

# echo "All arguments passed: $@"
# git mysql postfix net-tools
# packages=git for first time

for package in $@
do
    yum list installed $package &>> $LOGFILE # check installed or not
    if [ $? -ne 0 ] #if not installed
    then
        yum install $package -y &>> $LOGFILE #install the package
        VALIDATE $? "Installation of $package" #validate
    else
        echo -e "$package is already installed ... $y skipped $N"
    fi
done