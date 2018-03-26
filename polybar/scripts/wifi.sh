#!/usr/bin/env bash
#######################
### Polybar config ####
#######################
# [module/wifi]
# type = custom/script
# exec = $HOME/.config/polybar/scripts/wifi.sh
# format-prefix = " "
# format-prefix-foreground = #1793d1 #i.e.
### to have all states visible during the connexion, specify an interval < 1
# interval = 0.5 


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
