#!/bin/bash

connected=$(nordvpn status | grep "Status:")

if [[ "$connected" == "Status: Connected"*  ]]
then
  echo "{\"text\":\"󰢭\"}"
else
  echo "{\"text\":\"\"}"
fi
