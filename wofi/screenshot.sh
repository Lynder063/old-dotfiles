#!/bin/bash

choice=$(printf 'Window Screenshot\nMonitor Screenshot' | wofi --show=dmenu)

case "$choice" in
  "Window Screenshot")
    hyprshot -m window output --clipboard-only
    ;;
  "Monitor Screenshot")
    hyprshot -m output --clipboard-only
    ;;
  *)
    echo "No valid choice or canceled."
    ;;
esac
