#!/bin/env sh

if [ "$(makoctl mode | tail -1)" == "dnd" ]; then
    echo "<span color='#f38ba8' size='110%'>󰂛</span>" 
else
    echo "<span size='110%'>󰂚</span>"
fi
