#!/bin/bash
set -uo pipefail
set -x

# Audio defaults at login (replaces NoiseTorch).
# Mic denoise + dereverb is now done by the DeepFilterNet PipeWire
# filter-chain in ~/.config/pipewire/pipewire.conf.d/99-deepfilter-source.conf,
# which exposes the virtual source "deepfilter_source".

# Wait for PipeWire + USB devices to settle after login.
sleep 10

HYPERX_CARD="alsa_card.usb-HP__Inc_HyperX_SoloCast-00"

# The filter-chain captures from the HyperX iec958 profile, so pin the card
# to it (wireplumber occasionally auto-selects the wrong input profile).
pactl set-card-profile "$HYPERX_CARD" input:iec958-stereo || true

sleep 1

# Route mic through DeepFilterNet, output to the Creative speakers.
pactl set-default-source deepfilter_source || true

OUTPUT_DEVICE=$(pactl list short sinks | grep Creative | cut -f 1 || true)
[ -n "${OUTPUT_DEVICE}" ] && pactl set-default-sink "${OUTPUT_DEVICE}"

exit 0
