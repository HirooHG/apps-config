#!/bin/sh

interface="wlan0"
count=0
path="$HOME/apps-config/scripts/wpa"
arg=$1

function verif {
  cd $path
  list=$(ls -a | cut -d'.' -f2)
  isGood=false
  for i in $list
  do
    if [ $arg == $i ]; then
      isGood=true
    fi
  done
}

if [ $arg ]
then
  verif

  if [ $isGood == false ]; then
    echo "there's nothing like this" && exit 1
  fi
  
  until [ $count == 1 ]
  do
    sudo pkill -e wpa_supplicant
    count=$(sudo wpa_supplicant -B -i $interface -c $path/wpa_supplicant.$arg.conf | wc -l) || echo bruh
    sudo dhcpcd -q
  done
  exit 0
else
  echo "argument pls" && exit 1
fi
