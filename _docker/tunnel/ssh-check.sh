#!/usr/bin/env bash

ssh_exists1=`ps -ae | grep ssh`
ssh_exists2=${#ssh_exists1}

if [ 0 -eq "$ssh_exists2" ]
    then
        ssh -o StrictHostKeyChecking=no -fNg -L 3307:db-wkda.aws-eu-qa-1.auto1-test.com:21599 deploy@52.50.156.76 -p21598
        #echo "ssh tunnel restored" >> /var/log/cron.log
fi