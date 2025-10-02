#!/bin/env bash

if pgrep -x "wf-recorder" > /dev/null; then
    echo '{"text":"󰑋","class":"active"}'
else
    echo '{"text":"","class":"inactive"}'
fi
