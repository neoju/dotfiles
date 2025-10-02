#!/bin/bash

IS_EMPTY=$(hyprctl workspaces -j | jq '(.[] | select(.id == 1) | .windows == 0) // (all(.[]; .id != 1))')
echo $IS_EMPTY

if [ $IS_EMPTY == true ]; then
    echo "No windows on workspace 2, launching applications..."

    hyprctl dispatch workspace 1
    # hyprctl dispatch moveworkspacetomonitor 2 DP-3

    # Open Google Chrome with three tabs
    firefox --new-window \
        -new-tab -url https://mail.google.com \
        -new-tab -url https://youtube.com \
        -new-tab -url https://grok.com \
        -new-tab -url https://facebook.com \
        -new-tab -url https://chat.zalo.me > /dev/null 2>&1 &

    # Open Ghostty terminal
    ghostty -e sh -c "macchina; exec $SHELL" > /dev/null 2>&1 &
fi
else
    echo "Windows already present on workspace 2, exiting script."
fi

exit 1

