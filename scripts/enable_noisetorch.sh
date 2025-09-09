#!/bin/bash

set -euo pipefail
set -x

sleep 10
INPUT_DEVICE=$(noisetorch -l | grep HyperX_SoloCast | sed -e "s/\tDevice ID:\s//g")
OUTPUT_DEVICE=$(pactl list short sinks | grep Creative | cut -f 1)

/sbin/noisetorch -i -s "${INPUT_DEVICE}"

sleep 1

/sbin/pactl set-default-source "$(pactl list short sources | grep NoiseTorch | cut -f 1)"
/sbin/pactl set-default-sink "${OUTPUT_DEVICE}"

exit 0
