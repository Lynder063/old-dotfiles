#!/bin/bash

# Define the screenshot directory
screenshot_dir="$HOME/Pictures/Screenshots"

# Check if the screenshot directory exists, if not, send a notification
if [ ! -d "$screenshot_dir" ]; then
	notify-send "Screenshot directory ($screenshot_dir) does not exist."
	exit 1
fi

# Define the options for wofi
options=("Whole Screen" "Selected Window" "Area")

# Prompt the user to choose an option using wofi
chosen_option=$(printf '%s\n' "${options[@]}" | wofi --dmenu)

# Perform the corresponding action based on the chosen option
case "$chosen_option" in
"Whole Screen")
	# Take a screenshot of the whole screen and save it to the directory
	hyprshot -m output -o "$screenshot_dir" -- "$(date +'%Y-%m-%d_%H-%M-%S').png"
	;;
"Selected Window")
	# Take a screenshot of the selected window and save it to the directory
	hyprshot -m window -o "$screenshot_dir" -- "$(date +'%Y-%m-%d_%H-%M-%S').png"
	;;
"Area")
	# Take a screenshot of the selected region and save it to the directory
	hyprshot -m region -o "$screenshot_dir" -- "$(date +'%Y-%m-%d_%H-%M-%S').png"
	;;
*)
	# If an invalid option is chosen, notify the user
	notify-send "Invalid option chosen."
	exit 1
	;;
esac

# Notify the user that the screenshot has been saved
notify-send "📷 Screenshot taken"
