#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

ipAddress=$(ip a | grep -e wlp1s0 -e enp3s0 | grep inet | awk '{print $2}')

signalPower=$(cat /proc/net/wireless | tail -1 | tr -s ' ' | cut -d' ' -f4 | sed 's/\./dBm/')

echo "${ipAddress}" "${signalPower}"
