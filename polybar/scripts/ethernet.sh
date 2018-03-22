#!/bin/bash
#interface=$(ifconfig| grep enp | grep -v c4i | cut -d":" -f1)
label=" "
#label_down=" "
label_down=" "
#label="E: "
ifconfig enp0s20f0u1u2 >/dev/null 2>&1
DEVICE="$?"
if [[ $DEVICE = "0" ]]; then
	interface=enp0s20f0u1u2
	speed=$(sudo ethtool enp0s20f0u1u2 | grep Speed | cut -d":" -f2)
	nmcli connection show --active | grep ${interface} >/dev/null 2>&1
	DGFIP_UP="$?"
	#DGFIP_UP="enp0s20f0u1u2"
	ipaddr=$(ifconfig enp0s20f0u1u2 | grep "inet " | awk '{ print $2}')
	if [[ $DGFIP_UP = "0" ]]; then 
		echo -n $speed
		#$ipaddr
	fi
else
	echo -en $label_down 
fi
