#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    crh=`ip route get 1 | awk '{print $NF;exit}'`

    #/sbin/ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'
    # using command above causes to get docker0 address
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    crh=`ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}' `
fi

echo "Current remote host: "${crh}
export CRH=${crh}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    crh=`ip route get 1 | awk '{print $NF;exit}'`
    sudo -E docker-compose -f _docker/dev-compose.yml down
    sleep 5
    sudo -E docker-compose -f _docker/dev-compose.yml up -d
    sudo -E docker exec -itd admin_php bash -c "/var/local/ssh-check.sh; cron"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    docker-compose -f _docker/dev-compose.yml down
    sleep 5
    docker-compose -f _docker/dev-compose.yml up -d
    docker exec -itd admin_php bash -c "/var/local/ssh-check.sh; cron"
fi
sleep 5
