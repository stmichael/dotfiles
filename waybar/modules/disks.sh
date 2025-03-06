#!/bin/bash

get_first_disk() {
  udiskie-info -a -o "{mount_path},{device_file},{ui_id_label},{is_mounted}" | awk -F',' '{print "{\"path\":\"" $1 "\",\"device\":\"" $2 "\",\"label\":\"" $3 "\",\"mounted\":\"" $4 "\"}"}' | jq -c 'select(.mounted=="True")' | head
}

eject_first_disk() {
  local device=$(get_first_disk | jq -r '.device')
  local name=$(get_first_disk | jq -r '.label')
  udiskie-umount $device && notify-send "$name can be removed"
}

while [[ $# -gt 0 ]]; do
  case $1 in
    -h|--help)
      usage
      shift
      ;;
    *)
      ACTION=$1
      shift
      ;;
  esac
done

if [[ $ACTION = "get" ]]
then
  get_first_disk | jq -c '{text: .label}'
elif [[ $ACTION = "eject" ]]
then
  eject_first_disk
else
  echo "Unknown action $ACTION"
  exit 1
fi
