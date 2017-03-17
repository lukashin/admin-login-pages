#!/usr/bin/env bash
sleep 5
ssh -o StrictHostKeyChecking=no -fNg -L 3307:db-wkda.aws-eu-qa-1.auto1-test.com:21599 deploy@52.50.156.76 -p21598
cron && tail -f /var/log/cron.log