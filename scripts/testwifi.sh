#!/bin/bash

count=0

until [ $count == 1 ]
do
  ping gnu.org > /dev/null && count=1
  sleep 0.5
done

echo yay
