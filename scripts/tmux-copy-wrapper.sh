#!/usr/bin/env sh
# tmux -> clipboard wrapper: prefer wl-copy, fallback to xclip/greenclip.
# Usage: stdin -> clipboard
# Make sure this script is executable.

# Where to log (for debug)
LOG="$HOME/.cache/tmux-copy-wrapper.log"

cmd=""
# prefer wl-copy (Wayland)
if command -v wl-copy >/dev/null 2>&1; then
  cmd="wl-copy --type text"
fi

# fallback: xclip (X11)
if [ -z "$cmd" ] && command -v xclip >/dev/null 2>&1; then
  cmd="xclip -i -selection clipboard"
fi

# fallback: greenclip (if present)
if [ -z "$cmd" ] && command -v greenclip >/dev/null 2>&1; then
  cmd="greenclip store"
fi

# If nothing found, exit non-zero
if [ -z "$cmd" ]; then
  printf 'Error: no clipboard backend found (wl-copy/greenclip/xclip)\n' >&2
  exit 1
fi

# Execute copy, read from stdin
# Use POSIX sh builtin to avoid problems
if printf '' | $cmd >/dev/null 2>&1; then
  # primary attempt: just pipe stdin to chosen cmd
  cat - | $cmd
else
  # In some rare envs wl-copy fails because WAYLAND_DISPLAY/XDG_RUNTIME_DIR not set.
  # Try to guess XDG_RUNTIME_DIR from user session (only works if loginctl provides it).
  # This is a fallback; if it fails, user should start tmux from graphical session or
  # provide environment variables to tmux systemd unit.
  if [ -n "$XDG_RUNTIME_DIR" ] && [ -n "$WAYLAND_DISPLAY" ]; then
    cat - | $cmd
  else
    # Try to find a wayland socket in /run/user/$UID/
    WDIR="/run/user/$(id -u)"
    SOCKET=$(ls "$WDIR" 2>/dev/null | grep -E '^wayland-[0-9]+' | head -n1)
    if [ -n "$SOCKET" ]; then
      export XDG_RUNTIME_DIR="$WDIR"
      export WAYLAND_DISPLAY="$SOCKET"
      cat - | $cmd
    else
      # give up and try xclip if available
      if command -v xclip >/dev/null 2>&1; then
        cat - | xclip -i -selection clipboard
      else
        printf 'Error: failed to access wl-copy and no xclip available\n' >&2
        exit 1
      fi
    fi
  fi
fi
