#!/bin/bash

# Terminate already running bar instance
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise, you can use the nuclear option
# killall -q polybar

# Launch polybar
echo "**** new mainBar instance ****" | tee -a /tmp/mainBar.log
polybar mainBar 2>&1 | tee -a /tmp/mainBar.log & disown
