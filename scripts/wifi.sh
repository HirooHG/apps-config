#!/bin/sh

interface="wlan0"

count=0
path="$HOME/apps-config/scripts/wpa/wpa_supplicant"

if [ $1 ]
then
  until [ $count == 1 ]
  do
    sudo pkill -e wpa_supplicant
    count=$(sudo wpa_supplicant -B -i $interface -c $path.$1.conf | wc -l) || echo bruh
    sudo dhcpcd -q
  done
  exit 0
else
  exit 1
fi
