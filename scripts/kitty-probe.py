#!/usr/bin/env python3
r"""Probe how the terminal reports modified keys under the kitty keyboard protocol.

Use this when a modified key (Shift+Enter, Ctrl+Backspace, ...) reaches an
application as the unmodified key. Run it twice - once outside tmux and once
inside - and compare the logged byte sequences.

    kitty-probe.py <logfile> [seconds]

Press the key under test, then Ctrl+D (Ctrl+C is a key event in raw mode and
does not interrupt this script). Timeout ends the probe on its own.

Interpretation:
    ESC [ ? 1 u        terminal accepted the disambiguate flag (kitty capable)
    ESC [ 13 ; 2 u     Shift+Enter reported with modifiers - what we want
    0d                 plain CR - the terminal never saw an enable request
Inside tmux, also check that the client advertises the `extkeys` feature:

    tmux list-clients -F '#{client_termname} #{client_termfeatures}'

tmux only enables extended keys on the outer terminal through the terminfo
Eneks/Dseks capabilities, which alacritty does not ship, and its default
Eneks value (ESC [ > 4 ; 2 m, xterm modifyOtherKeys) is unsupported there:

    set -as terminal-features ',alacritty:extkeys'
    set -as terminal-overrides ',alacritty:Eneks=\E[>1u:Dseks=\E[<u'
"""

import os
import select
import sys
import termios
import time
import tty


def main() -> int:
    if len(sys.argv) < 2:
        print(__doc__, file=sys.stderr)
        return 2

    log_path = sys.argv[1]
    seconds = float(sys.argv[2]) if len(sys.argv) > 2 else 12.0

    fd = sys.stdin.fileno()
    original = termios.tcgetattr(fd)
    log = open(log_path, "w", buffering=1)

    def say(line: str) -> None:
        os.write(1, (line + "\r\n").encode())
        log.write(line + "\n")

    try:
        # Ask for disambiguated keys, then read back the flags the terminal granted.
        sys.stdout.write("\x1b[>1u")
        sys.stdout.write("\x1b[?u")
        sys.stdout.flush()
        tty.setraw(fd)

        say(f"=== kitty probe start {time.strftime('%FT%T')} (log={log_path})")
        say("press the key under test, then Ctrl+D")

        deadline = time.time() + seconds
        while time.time() < deadline:
            readable, _, _ = select.select([fd], [], [], 0.2)
            if not readable:
                continue
            data = os.read(fd, 256)
            hexed = " ".join(f"{byte:02x}" for byte in data)
            say(f"bytes: {hexed}   {data!r}")
            if b"\x04" in data:
                break
        say("=== probe end")
    finally:
        sys.stdout.write("\x1b[<u")
        sys.stdout.flush()
        termios.tcsetattr(fd, termios.TCSADRAIN, original)
        log.close()

    print(f"logged -> {log_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
