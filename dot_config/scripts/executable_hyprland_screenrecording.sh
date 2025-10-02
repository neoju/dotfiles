#!/bin/env bash

pgrep -x "wf-recorder" && pkill -INT -x wf-recorder \
    && notify-send -h string:wf-recorder:record -t 1000 "Finished Recording" \
    && exit 0

dateTime=$(date +%m-%d-%Y-%H:%M:%S)

wf-recorder -g "$(slurp)" --bframes max_b_frames -f $HOME/records/$dateTime.mp4 /dev/null 2>&1 &

