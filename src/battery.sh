#!/bin/sh
#--------------------------------
# tmux-battery status
#--------------------------------
battery=`cat /sys/class/power_supply/BAT0/capacity`
if [ "$battery" -lt 20 ]; then
  if [ "`upower -i $(upower -e | grep 'BAT') | grep -E "state" | sed -r -e 's/ +//g' | cut -d ":" -f2`" = 'discharging' ]; then
        echo "#[fg=colour234,bg=colour1,bold] $battery%"
    else
        echo "#[fg=colour234,bg=colour166,bold] $battery%"
    fi
else
    echo "#[fg=colour234,bg=colour2,bold] $battery%"
fi
