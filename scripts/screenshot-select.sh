#!/bin/bash

DIR="$HOME/Pictures/ScreenShots"
mkdir -p "$DIR"
FILE="$DIR/screenshot-$(date +%F_%H%M%S).png"

GEOM=$(slurp) || exit 0
[ -z "$GEOM" ] && exit 0

grim -g "${GEOM}" - \
	| tee "${FILE}" \
	| wl-copy --type=image/png
