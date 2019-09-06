#!/bin/bash

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/home/pi/bootlog.log 2>&1
# Everything below will go to the file 'log.out':
cd /home/pi/QbusServer
mono QServer.exe &



