#!/bin/env sh

on_activewindow() {
    pkill -SIGRTMIN+9 waybar;
}

handle() {
  case $1 in
      activewindow*) on_activewindow ;;
      activewindowv2*) on_activewindow ;;
  esac
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock \
    | while read -r line; do handle "$line"; done
