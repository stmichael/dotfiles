#!/bin/bash

nmcli connection show tun0 > /dev/null 2>&1

if [ $? -eq 0 ]
then
  echo "{\"text\":\"󰢭\"}"
else
  echo "{\"text\":\"\"}"
fi
