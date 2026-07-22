#!/bin/bash

MONITOR="eDP-1"
status=$(hyprctl monitors | grep -A 21 "Monitor $MONITOR" | grep "disabled:" | awk '{print $2}')

if [ "$status" = "false" ]; then
    hyprctl keyword monitor "$MONITOR, disable"
else
    hyprctl keyword monitor "$MONITOR,3200x2000@120,0x0,2"
fi
