#!/bin/bash
mkdir logs
touch data/security.quick.blacklist.list
#
#auto catch current host ip
crh=`ipconfig getifaddr en0`
echo "Current remote host: "${crh}
export CRH=${crh}

#auto stop apache if running
apache=`ps ax | grep -v grep | grep httpd`
apache_running=${#apache}
if [[ "$OSTYPE" = "darwin"* && 0 != "$apache_running" ]]; then
echo "Stopping Os X apache...: "
sudo apachectl stop
fi

#docker itself
docker-compose -f _docker/dev-compose.yml build
docker-compose -f _docker/dev-compose.yml up -d


