#!/bin/bash

count=0

until [ $count == 1 ]
do
  ping gnu.org
  sleep 1
done
