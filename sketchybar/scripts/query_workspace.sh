#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  sketchybar --set $NAME label="$(aerospace list-workspaces --focused)"
fi
