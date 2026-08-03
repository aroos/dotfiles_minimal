#!/bin/bash

# Update battery status percentage and icon

PERCENT=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ -z "$PERCENT" ]; then
  exit 0
fi

if [ -n "$CHARGING" ]; then
  ICON="⚡"
else
  if [ "$PERCENT" -gt 80 ]; then
    ICON=""
  elif [ "$PERCENT" -gt 60 ]; then
    ICON=""
  elif [ "$PERCENT" -gt 40 ]; then
    ICON=""
  elif [ "$PERCENT" -gt 20 ]; then
    ICON=""
  else
    ICON=""
  fi
fi

sketchybar --set $NAME label="${PERCENT}%" icon="$ICON"
