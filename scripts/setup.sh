#!/bin/bash

# make script run once a day. Resource: https://stackoverflow.com/questions/4880290/how-do-i-create-a-crontab-through-a-script
(crontab -l 2>/dev/null; echo "00 00 * * * ~/Desktop/rmc/scripts/main.sh") | crontab -