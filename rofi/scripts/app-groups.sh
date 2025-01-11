#!/usr/bin/env bash

if [ "$ROFI_RETV" -eq 1 ]
then
  coproc ( app-groups open $ROFI_INFO > /dev/null 2>&1 )
  exit 0
fi

if [ "$ROFI_RETV" -eq 0 ]
then
  app-groups list | jq -r 'to_entries[] | .value.name + "\u0000info\u001f" + .key'
fi
