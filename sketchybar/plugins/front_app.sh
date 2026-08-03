#!/bin/bash

# Display the frontmost app name and an appropriate Nerd Font icon
# $INFO is passed as an env var containing the name of the focused app

case "$INFO" in
  "WezTerm"|"Ghostty"|"Alacritty"|"Terminal"|"iTerm2")
    ICON=""
    ;;
  "Google Chrome"|"Safari"|"Zen"|"Arc"|"Firefox")
    ICON=""
    ;;
  "Visual Studio Code"|"VSCode"|"Cursor"|"Neovim"|"Xcode")
    ICON="󰨞"
    ;;
  "Finder")
    ICON="󰀶"
    ;;
  "Slack")
    ICON=""
    ;;
  "Discord")
    ICON="󰙯"
    ;;
  "Spotify"|"Music")
    ICON=""
    ;;
  "System Settings")
    ICON=""
    ;;
  *)
    # Default window icon
    ICON=""
    ;;
esac

sketchybar --set $NAME icon="$ICON" label="$INFO"
