#!/usr/bin/env bash

if [ "$ROFI_RETV" -eq 1 ]
then
  if [ "$ROFI_INFO" = "disconnect" ]
  then
    coproc ( nordvpn disconnect > /dev/null 2>&1 )
  else
    coproc ( nordvpn connect -c $ROFI_INFO > /dev/null 2>&1 )
  fi
  exit 0
fi

if [ "$ROFI_RETV" -eq 0 ]
then
  echo -en "VPN: disconnect\0info\x1fdisconnect\x1ficon\x1fnetwork-vpn-disabled-symbolic\n"
  nordvpn list-countries | sed -r 's/^(.*)$/VPN \1\x0info\x1f\1\x1ficon\x1f\/home\/stmichael\/.config\/rofi\/icons\/flags\/4x3\/\1.svg/'
fi
