#!/bin/bash

# Check if Lid Switch is turning off
if [ "$SWITCH_STATE" == "off" ]; then
    # Check if an external monitor is connected using xrandr
    if xrandr | grep "HDMI-A-1 connected"; then
        # External monitor is connected, turn off laptop monitor
        hyprctl keyword monitor "eDP-1, disable"
    else
        # No external monitor connected, do nothing or handle as needed
        echo "No external monitor connected."
    fi
fi

