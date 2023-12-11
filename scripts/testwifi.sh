#!/bin/bash

count=0

until [ $count == 1 ]
do
  ip=$(ip a | grep wlan0 | grep inet | awk '{print $2}')
  if [ -z "$ip" ]; then
    echo "not connected"
    sleep 1
  else
    echo "connected"
    count=1
  fi
done
