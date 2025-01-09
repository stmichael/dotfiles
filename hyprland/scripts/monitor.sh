#!/bin/sh

enable_monitor() {
  local monitor=$1
  if [[ $DRY_RUN -eq 1 ]]
  then
    echo "-> hyprctl keyword monitor $monitor, enable"
  else
    hyprctl keyword monitor $monitor, enable
    wlrlui -m
  fi
}

disable_monitor() {
  local monitor=$1
  if [[ $DRY_RUN -eq 1 ]]
  then
    echo "-> hyprctl keyword monitor $monitor, disable"
  else
    hyprctl keyword monitor $monitor, disable
  fi
}

usage() {
    echo "Usage: $0 MONITOR ACTION [--dry-run]"
    echo "Enables or disables monitors."
    echo ""
    echo "ACTION can be any of: enable, disable"
    echo "Options:"
    echo " -h, --help This help"
    echo " --dry-run  Doesn't perform any monitor operations, only prints what it would do"
    exit 1
}

DRY_RUN=0
while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      usage
      shift
      ;;
    --dry-run)
      DRY_RUN=1
      shift
      ;;
    *)
      ACTION=$1
      MONITOR=$2
      shift
      shift
      ;;
  esac
done

if [[ $ACTION = "enable" ]]
then
  enable_monitor $MONITOR
elif [[ $ACTION = "disable" ]]
then
  disable_monitor $MONITOR
else
  echo "Unknown action $ACTION"
  exit 1
fi
