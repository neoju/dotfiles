#!/bin/env sh

current="$(fcitx5-remote -n)"

if [ "$current" == "keyboard-us" ]; then
    fcitx5-remote -s unikey
else
    fcitx5-remote -s keyboard-us
fi

fcitx5-remote -r
