#!/bin/bash

# make script run every 2 hours. Resource: https://stackoverflow.com/questions/4880290/how-do-i-create-a-crontab-through-a-script
(crontab -l 2>/dev/null; echo "0 */2 * * * ~/Desktop/rmc/scripts/main.sh $1") | crontab -