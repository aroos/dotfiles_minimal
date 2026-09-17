#!/bin/bash

# Update workspace style and display open app icons when AeroSpace changes workspace
# $NAME holds the sketchybar item name (e.g., space.1, space.2)
# $FOCUSED_WORKSPACE is passed as an env var from the trigger in aerospace.toml

export PATH="/opt/homebrew/bin:$PATH"

INDEX=${NAME#space.}


# Sourcing the icon map helper
source "$HOME/.config/sketchybar/icon_map.sh"

# If $FOCUSED_WORKSPACE is empty, fetch it dynamically
if [ -z "$FOCUSED_WORKSPACE" ]; then
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null || echo "T")
fi

# Find all unique app names on this workspace
apps=$(aerospace list-windows --workspace "$INDEX" --format "%{app-name}" | sort -u)

# Convert app names to icons using sketchybar-app-font ligatures
icon_strip=""
if [ -n "$apps" ]; then
  while IFS= read -r app; do
    __icon_map "$app"
    icon_strip+=" $icon_result"
  done <<< "$apps"
fi

# Set display label and background colors
if [ "$INDEX" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.color=0xffa6e3a1 icon.color=0xff11111b label.color=0xff11111b label="$icon_strip"
else
  sketchybar --set $NAME background.color=0xff181825 icon.color=0xffa6adc8 label.color=0xffa6adc8 label="$icon_strip"
fi


