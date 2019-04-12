#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'


TouchPad="ETPS/2 Elantech Touchpad"

CurrentStatus=$(xinput list-props "${TouchPad}" | grep "Device Enabled" | cut -d ':' -f 2 | sed -e 's/\t//g')

if [[ ${CurrentStatus} -eq 1 ]]; then
  xinput disable ${TouchPad}
  exit 0
fi

xinput enable ${TouchPad}
exit 0
