#!/bin/env sh

current="$(fcitx5-remote -n)"

if [ "$current" == "keyboard-us" ]; then
    echo "en"
elif [ "$current" == "unikey" ]; then
    echo "vi"
else
    echo $current
fi

