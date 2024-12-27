#!/bin/bash

queue=$(lpq -a | tail +2)
if [[ $queue = "" ]]; then
  echo "{\"text\":\"0\", \"tooltip\":\"\"}"
else
  tooltip=$(echo "$queue" | sed 'N;s/\n/\\n/')

  echo "{\"text\":\"$(echo "$queue" | wc -l)\", \"tooltip\":\"$(echo "$tooltip")\"}"
fi
