#!/bin/sh
latest="$(find /lib/modules -mindepth 1 -maxdepth 1 -type d -printf '%f\n' 2>/dev/null | sort -V | tail -n 1)"
current="$(uname -r)"

if [ -n "$latest" ] && [ "$current" != "$latest" ]; then
  printf ' Reboot required'
fi
