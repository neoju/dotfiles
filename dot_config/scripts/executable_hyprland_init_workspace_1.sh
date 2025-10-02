#!/bin/bash

IS_EMPTY=$(hyprctl workspaces -j | jq '(.[] | select(.id == 2) | .windows == 0) // (all(.[]; .id != 2))')
echo $IS_EMPTY

if [ $IS_EMPTY == true ]; then
    echo "No windows on workspace 2, launching applications..."

    # Dispatch workspace 2 to monitor DP-3
    hyprctl dispatch workspace 2
    # hyprctl dispatch moveworkspacetomonitor 3 DP-3

    # Open Google Chrome with three tabs
    chromium --new-window \
        https://teams.live.com/v2/ \
        https://mail.google.com/ \
        https://bitville.atlassian.net/jira/for-you > /dev/null 2>&1 &

    # Open Ghostty terminal
    ghostty -e sh -c "macchina; exec $SHELL" > /dev/null 2>&1 &
else
    echo "Windows already present on workspace 2, exiting script."
fi

exit 1

