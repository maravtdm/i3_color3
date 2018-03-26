#!/usr/bin/env bash
state=$(nmcli dev sh wlp1s0 | awk '/GENERAL.STATE:/ {print $2}')
essid=$(nmcli dev sh wlp1s0 | awk '/GENERAL.CONNECTION:/ {print $2}')
label_deconnected=" "

case $state in
30)
	echo "$label_deconnected"
	;;
50)
	echo "connexion..."
	;;
70)
	echo "config ip..."
	;;
100)
	echo "$essid"
	;;
esac

