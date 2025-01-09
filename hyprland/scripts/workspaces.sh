#!/bin/sh

handle_event() {
  # Possible events:
  # monitoraddedv2>>1,DP-3,BNQ BenQ PD2710QC RAJ0256801Q
  # monitorremoved>>DP-3
  case $1 in
    monitoraddedv2*) handle_monitor_change ;;
    monitorremoved*) handle_monitor_change ;;
  esac
}

handle_monitor_change() {
  local monitorCount=$(hyprctl monitors -j | jq '. | length')
  if [[ $monitorCount -eq 1 ]]
  then
    setup_single_monitor_layout
  elif [[ $monitorCount -eq 2 ]]
  then
    setup_two_monitor_layout
  else
    setup_two_monitor_layout
  fi
}

setup_single_monitor_layout() {
  local monitorId=$(hyprctl monitors -j | jq '.[].id')
  echo "Moving all workspaces to monitor $monitorId"
  move_workspace_to_monitor 1 $monitorId
  move_workspace_to_monitor 2 $monitorId
  move_workspace_to_monitor 3 $monitorId
  move_workspace_to_monitor 4 $monitorId
}

setup_two_monitor_layout() {
  local index=0
  hyprctl monitors -j | jq -r '.[].id' | while read -r monitorId
  do
    if [[ $index -eq 0 ]]
    then
      echo "Moving workspace 1 to monitor $monitorId"
      move_workspace_to_monitor 1 $monitorId
    elif [[ $index -eq 1 ]]
    then
      echo "Moving other workspaces to monitor $monitorId"
      move_workspace_to_monitor 2 $monitorId
      move_workspace_to_monitor 3 $monitorId
      move_workspace_to_monitor 4 $monitorId
    fi
    index=$((index+1))
  done
}

move_workspace_to_monitor() {
  local workspace=$1
  local monitor=$2
  hyprctl dispatch moveworkspacetomonitor $workspace $monitor > /dev/null
  hyprctl keyword workspace $workspace, $monitor > /dev/null
}

listen_to_monitor_change() {
  # Update the monitors initially
  handle_monitor_change

  socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line
  do
    handle_event "$line"
  done
}

usage() {
    echo "Usage: $0 ACTION"
    echo "Adjust workspaces to the monitor layout."
    echo ""
    echo "ACTION can be any of:"
    echo "fix: adjusts the workspaces according to the monitor layout"
    echo "            at the time of invocation."
    echo "follow-monitors: listens the monitor changes on the hyprland"
    echo "                        event socket and adjusts the workspaces whenever"
    echo "                        you plug or unplug a monitor."
    echo "Options:"
    echo " -h, --help This help"
    exit 1
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

if [[ $ACTION -eq "fix" ]]
then
  handle_monitor_change
elif [[ $ACTION -eq "follow-monitors" ]]
then
  listen_to_monitor_change
fi
