#!/bin/bash

focused_app="$(yabai -m query --windows --window | jq -re '.app')"
focused_id="$(yabai -m query --windows --window | jq '.id')"
terminal="kitty"

if [[ $focused_app = ${terminal} ]]; then
  osascript -e "tell application \"System Events\" to set visible of first process ¬" \
    -e "whose name is \"${terminal}\" to false"
else
  osascript -e "tell application \"System Events\" to set visible of first process ¬" \
    -e "whose name is \"${terminal}\" to true"

  osascript -e "tell application \"System Events\" to tell process \"${terminal}\"" \
    -e 'set frontmost to true' \
    -e 'if windows is not {} then perform action "AXRaise" of item 1 of windows' \
    -e 'end tell'
fi
