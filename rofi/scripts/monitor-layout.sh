#!/usr/bin/env bash

if [ "$ROFI_RETV" -eq 1 ]
then
  if [ "$ROFI_INFO" == "apply" ]
  then
    coproc ( hyprctl eval 'local w = require("workspaces"); w.apply();' )
  elif [ "$ROFI_INFO" == "one" ]
  then
    coproc ( hyprctl eval 'local w = require("workspaces"); w.apply_one_monitor_layout();' )
  elif [ "$ROFI_INFO" == "two" ]
  then
    coproc ( hyprctl eval 'local w = require("workspaces"); w.apply_two_monitor_layout();' )
  elif [ "$ROFI_INFO" == "presentation" ]
  then
    coproc ( hyprctl eval 'local w = require("workspaces"); w.apply_presentation_layout();' )
  elif [ "$ROFI_INFO" == "three" ]
  then
    coproc ( hyprctl eval 'local w = require("workspaces"); w.apply_three_monitor_layout();' )
  fi
  exit 0
fi

if [ "$ROFI_RETV" -eq 0 ]
then
  echo -en "Distribute by monitors\0info\x1fapply\x1ficon\x1ffocus-windows-symbolic\n"
  echo -en "One monitor layout\0info\x1fone\x1ficon\x1fvideo-display-symbolic\n"
  echo -en "Two monitor layout\0info\x1ftwo\x1ficon\x1fvideo-joined-displays-symbolic\n"
  echo -en "Presentation layout\0info\x1fpresentation\x1ficon\x1fcamera-video-symbolic\n"
  echo -en "Three monitor layout\0info\x1fthree\x1ficon\x1fvideo-joined-displays-symbolic\n"
fi
