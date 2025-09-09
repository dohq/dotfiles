#!/bin/bash

DIR="$HOME/Pictures/ScreenShots"
mkdir -p "$DIR"
FILE="$DIR/screenshot-$(date +%F_%H%M%S).png"

grim - \
	| tee "${FILE}" \
	| wl-copy --type=image/png
