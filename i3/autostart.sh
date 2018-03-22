#!/bin/sh

# Startup programs
xset -b &
setxkbmap -layout fr
numlockx on &
pactl set-sink-volume 0 '41%' &
compton --config ~/.config/compton/compton.conf &
sh ~/.config/arandr.sh &
sh ~/.config/polybar/launch.sh &

#feh --bg-fill ~/Documents/wallpaper/mignon.jpg ~/Documents/wallpaper/mignon.jpg &
feh --bg-fill ~/Documents/wallpaper/horse.jpg ~/Documents/wallpaper/horse.jpg &

megasync &
mpd /etc/mpd.conf &
guake &

#xautolock -detectsleep -time 5 -locker "~/.local/bin/lockscreen off" -nowlocker "~/.local/bin/lockscreen" &
#xautolock -detectsleep -time 10 -locker "~/.local/bin/lockscreen off" -locker "systemctl suspend" -nowlocker "~/.local/bin/lockscreen" &
xautolock -detectsleep -time 10 -locker "~/.local/bin/lockscreen off" -locker "systemctl hibernate" -nowlocker "~/.local/bin/lockscreen" &

# Touchpad
synclient TapButton1=1
synclient ClickFinger2=3 TapButton2=3
synclient VertTwoFingerScroll=1
synclient PalmDetect=1
