#!/bin/bash

# Display the frontmost app name and its sketchybar-app-font icon
# $INFO is passed as an env var containing the name of the focused app

source "$HOME/.config/sketchybar/icon_map.sh"

__icon_map "$INFO"

sketchybar --set "$NAME" icon="$icon_result" label="$INFO"

