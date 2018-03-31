#!/usr/bin/env sh

# Terminate already running bar instances
for i in polybar; do sudo pkill $i; done
for i in pactl; do sudo pkill $i; done

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 2; done

m=$(xrandr -q | grep "HDMI1" | awk '{print $1}')
status=$(xrandr -q | grep "HDMI1" | awk '{print $2}')

if [ "$status" == "connected" ]; then
	m="HDMI1"
	MONITOR=$m polybar --reload top &
        MONITOR=$m polybar --reload bottom &
else
	m="eDP1"
#	MONITOR=$m polybar -l info --reload top > ~/.config/polybar/top.log 2>&1 &
	MONITOR=$m polybar --reload top &
#        MONITOR=$m polybar -l info --reload bottom > ~/.config/polybar/bottom.log 2>&1 &
        MONITOR=$m polybar --reload bottom &
fi
