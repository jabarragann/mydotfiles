#!/bin/bash

program_name=$0

# Define your monitor names
monitor1="HDMI-0"
monitor2="DP-1"
monitor3="DVI-D-0"

# Store the current configuration
original_config=$(xrandr --current)

# Function to set single monitor configuration
function set_single_monitor {
    echo "Setting one monitor setup ...."
    xrandr --output "$1" --primary --mode 1920x1080 --pos 0x0 --output "$2" --off --output "$3" --off
}

# Function to set three monitor configuration
function set_three_monitors {
    echo "Setting three monitors setup ...."
    xrandr --output "$1" --primary --mode 1920x1080 --pos 0x0 --output "$2" --mode 1920x1080 --pos 1920x0 --output "$3" --mode 1920x1080 --pos 3840x0
}

function usage {
    echo "usage: $program_name [--one|--three]"
    echo "  --one     Activate one screen setup"
    echo "  --three   Activate three screen setup"
    exit 1
}

# set_three_monitors "$monitor1" "$monitor2" "$monitor3"

# Toggle between single and three monitor configurations
# if [[ $(xrandr --current) == "$original_config" ]]; then
#     set_single_monitor "$monitor1" "$monitor2" "$monitor3"
# else
#     set_three_monitors "$monitor1" "$monitor2" "$monitor3"
# fi

case $1 in
    --one)
        set_single_monitor "$monitor1" "$monitor2" "$monitor3"
        exit
        ;;
    --three)
        set_three_monitors "$monitor1" "$monitor2" "$monitor3"
        exit
        ;;
    *)
        usage 
        exit 1
        ;;
esac









