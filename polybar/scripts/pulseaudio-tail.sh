#!/bin/sh

sink=0

volume_up() {
    pactl set-sink-volume $sink +5%
}

volume_down() {
    pactl set-sink-volume $sink -5%
}

volume_mute() {
    pactl set-sink-mute $sink toggle
}

volume_print() {
    muted=$(pamixer --sink $sink --get-mute)

    if [ "$muted" = true ]; then
        echo "#1 --"
#	echo " "
    else
        volume=$(pamixer --sink $sink --get-volume)

        if [ "$volume" -lt 50 ]; then
#            echo " $volume %"
            echo "$volume %"
    	else
#            echo " $volume %"
            echo "$volume %"
        fi
    fi
}

listen() {
    volume_print

    pactl subscribe | while read -r event; do
        if echo "$event" | grep -q "#$sink"; then
            volume_print
        fi
    done
}

case "$1" in
    --up)
        volume_up
        ;;
    --down)
        volume_down
        ;;
    --mute)
        volume_mute
        ;;
    *)
        listen
        ;;
esac
