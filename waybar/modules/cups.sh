#!/bin/sh

queue=$(lpq -a | tail +2)
tooltip=$(echo "$queue" | sed 'N;s/\n/\\n/')

echo "{\"text\":\"$(echo "$queue" | wc -l)\", \"tooltip\":\"$(echo "$tooltip")\"}"
