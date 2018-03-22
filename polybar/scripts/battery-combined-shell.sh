
#!/bin/sh

path_ac="/sys/class/power_supply/ACAD"
bat_number=BAT1
path_battery="/sys/class/power_supply/${bat_number}"
time_wait=$(acpi -b | grep -v unavail | awk '{print $5}' | cut -d ":"  -f1,2)
ac=0
battery_level=0
battery_max=0

if [ -f "$path_ac/online" ]; then
    ac=$(cat "$path_ac/online")
fi

if [ -f "$path_battery/charge_now" ]; then
    battery_level=$(cat "$path_battery/charge_now")
fi

if [ -f "$path_battery/charge_full" ]; then
    battery_max=$(cat "$path_battery/charge_full")
fi

battery_level=$(("$battery_level"))
battery_max=$(("$battery_max"))
battery_percent=$(("$battery_level * 100"))
battery_percent=$(("$battery_percent / $battery_max"))

if [ "$ac" -eq 1 ]; then
    icon=""

    if [ "$battery_percent" -gt 97 ]; then
        echo "$icon $battery_percent% $time_wait"
    else
        echo "$icon $battery_percent% $time_wait"
    fi
else
    if [ "$battery_percent" -gt 85 ]; then
        icon=""
    elif [ "$battery_percent" -gt 60 ]; then
        icon=""
    elif [ "$battery_percent" -gt 35 ]; then
        icon=""
    elif [ "$battery_percent" -gt 10 ]; then
        icon=""
    elif [ "$battery_percent" -gt 5 ]; then
        icon=""
    else
        icon=""
    fi
    echo "$icon $battery_percent% $time_wait" 
    #$notify"
fi
