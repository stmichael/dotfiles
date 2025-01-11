#!/usr/bin/env bash

if [ "$ROFI_RETV" -eq 1 ]
then
  coproc ( hyprctl dispatch focuswindow "pid:$ROFI_INFO" > /dev/null 2>&1 )
  exit 0
fi

if [ "$ROFI_RETV" -eq 0 ]
then
  hyprctl clients -j | jq -r '.[] | (.title + "\u0000info\u001f" + (.pid | tostring))'
fi
