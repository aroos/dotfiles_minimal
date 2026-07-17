#!/bin/bash

# Update workspace style when AeroSpace changes workspace
# $NAME holds the sketchybar item name (e.g., space.1, space.2)
# $FOCUSED_WORKSPACE is passed as an env var from the trigger in aerospace.toml

INDEX=${NAME#space.}

if [ "$INDEX" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.color=0xffcba6f7 label.color=0xff11111b
else
  sketchybar --set $NAME background.color=0xff181825 label.color=0xffa6adc8
fi
