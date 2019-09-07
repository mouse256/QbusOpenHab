#!/bin/bash

#Functie om te loggen
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>/home/pi/clientlog.log 2>&1

#Wachten tot server is opgestart
sleep 30

#Start de Qbus Client
cd /home/pi/QbusOpenHab/QbusClient
mono QbusClient.exe 192.168.75.7 QBUS QBUS 002064 &
#mono ConsoleApp1.exe 192.168.13.55 QBUS QBUS 003893 &
