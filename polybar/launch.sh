#!/bin/bash

killall -q polybar

# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
#polybar main 2>&1 | tee -a /tmp/polybar.log & disown

#echo "Polybar launched..."

bar=main
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload $bar &
  done
else
  polybar --reload $bar &
fi

