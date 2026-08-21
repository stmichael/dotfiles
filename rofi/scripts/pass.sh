#!/usr/bin/env bash

PASS_STORE="$HOME/.password-store"

if [ "$ROFI_RETV" -eq 1 ]
then
  coproc ( pass -c $ROFI_INFO > /dev/null 2>&1 )
  exit 0
fi

if [ "$ROFI_RETV" -eq 0 ]
then
  find -L $PASS_STORE -type f -name "*.gpg" | sed "s|$PASS_STORE/\(.*\).gpg|\1\x0info\x1f\1|"
fi
