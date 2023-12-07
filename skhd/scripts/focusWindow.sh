yabai -m query --windows --space | jq 'map(select(.["is-floating"] == false).id)[0]' | xargs yabai -m window --focus
