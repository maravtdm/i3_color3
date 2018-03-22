
;=====================================================
;
;   To learn more about how to configure Polybar
;   go to https://github.com/jaagr/polybar
;
;   The README contains alot of information
;
;=====================================================

[colors]
;background = ${xrdb:color0:#222}
bg_trans = #aa000000
background = #222
background-alt = #333
foreground = #dfdfdf
foreground-alt = #555
primary = #ff9249
secondary = #e60053
alert = #ff0000
black = #000000
white = #ffffff
blue = #1793d1
red = #ff0000
orange = #ff9249
green = #00ff00
grey = #333333

vol1 = #ffe4e1
vol2 = #ff8888
vol3 = #ff0000

;;;;;;;;;;;;;;;;;
;;;; BAR TOP ;;;;
;;;;;;;;;;;;;;;;;

[bar/top]
monitor = ${env:MONITOR:HDMI1}
include-file = ~/.config/polybar/top-bar

modules-left = i3
modules-center = mpd
modules-right = mount filesystem volume backlight trash

;;;;;;;;;;;;;;;;;;;;
;;;; BAR BOTTOM ;;;;
;;;;;;;;;;;;;;;;;;;;

[bar/bottom]

monitor = ${env:MONITOR:HDMI1}
include-file = ~/.config/polybar/bottom-bar

;modules-left = xwindow
modules-left = kernel xwindow
modules-center = date-fr
modules-right = cpu cpu_load temp memory2 eth wifi battery-combined-shell yaourt 

;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; MODULES ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

[module/i3]
type = internal/i3
format = <label-state> <label-mode>
index-sort = true
enable-scroll = false
wrapping-scroll = false
pin-workspaces = true
strip-wsnumbers = true
fuzzy-match = true
label-mode-padding = 2
label-mode-foreground = #000
label-mode-background = ${colors.primary}
label-focused = %index%  %icon%
label-focused-background = ${colors.background-alt}
label-focused-underline = ${colors.red}
label-focused-padding = 2
label-unfocused = %index%  %icon%
label-unfocused-padding = 2
label-visible = %index%  %icon%
label-visible-background = ${self.label-focused-background}
label-visible-underline = ${self.label-focused-underline}
label-visible-padding = ${self.label-focused-padding}
label-urgent = %index%  %icon%
label-urgent-background = ${colors.alert}
label-urgent-padding = 2

ws-icon-0 = 1;
ws-icon-1 = 2;
ws-icon-2 = 3; 
ws-icon-3 = 4; 
ws-icon-4 = 5;
ws-icon-5 = 6;
ws-icon-6 = 7;
ws-icon-default = 

[module/mpd]
type = internal/mpd
host = 127.0.0.1
port = 6600
interval = 1
format-online = <label-song>  <label-time>  <bar-progress> <icon-random> <icon-repeat> <icon-repeatone>  <icon-prev>  <icon-seekb>  <icon-stop>  <toggle>  <icon-seekf>  <icon-next>  
format-offline = <label-offline>
icon-play = 
icon-play-foreground = ${colors.red}
icon-pause = 
icon-pause-foreground = ${colors.red}
icon-stop = 
icon-stop-foreground = ${colors.orange}
icon-prev = 
icon-next = 
icon-seekb = 
icon-seekf = 
icon-random = 
icon-repeat =  
icon-repeatone = "1 "
icon-prev-font = 4
icon-stop-font = 4
label-offline = mpd if offline
label-song = %artist% - %title%
label-song-maxlen = 30
label-song-ellipsis = true
toggle-on-foreground = ${colors.red}
toggle-off-foreground = ${colors.white}
bar-progress-width = 30
bar-progress-foreground-0 = ${colors.vol1}
bar-progress-foreground-1 = ${colors.vol1}
bar-progress-foreground-2 = ${colors.vol2}
bar-progress-foreground-3 = ${colors.vol2}
bar-progress-foreground-4 = ${colors.vol3}
bar-progress-foreground-5 = ${colors.vol3}
bar-progress-gradient = true
bar-progress-indicator = |
bar-progress-indicator-font = 0
bar-progress-font = 2
bar-progress-indicator-foreground = #ff
bar-progress-fill = |
bar-progress-fill-font = 2
bar-progress-empty = -
bar-progress-empty-font = 2
bar-progress-empty-foreground = ${colors.foreground-alt}

[module/kernel]
type = custom/script
interval = 1024
exec = ~/.config/polybar/scripts/kernel.sh
format = <label>
;format-prefix = "  "
format-prefix = "  "
format-prefix-foreground = ${colors.red}

[module/mount]
type = custom/script
interval = 5
exec = ~/.config/polybar/scripts/mount.sh
format = <label>
format-prefix = " "
format-prefix-foreground = ${colors.red}

[module/volume]
type = internal/volume
format-volume = <label-volume> <bar-volume>
label-volume = "%percentage%%"
format-volume-prefix = " "
format-volume-prefix-foreground = ${colors.red}
label-volume-foreground = ${root.foreground}
format-muted = <label-muted> <bar-volume>
format-muted-prefix = " "
format-muted-prefix-foreground = ${colors.orange}
label-muted = "%percentage%%"
bar-volume-prefix = "  "
bar-volume-width = 30
bar-volume-foreground-0 = ${colors.vol1}
bar-volume-foreground-1 = ${colors.vol1}
bar-volume-foreground-2 = ${colors.vol2}
bar-volume-foreground-3 = ${colors.vol2}
bar-volume-foreground-4 = ${colors.red}
bar-volume-foreground-5 = ${colors.red}
bar-volume-gradient = true
bar-volume-indicator = |
bar-volume-indicator-font = 2
bar-volume-fill = |
bar-volume-fill-font = 2
bar-volume-empty = ─
bar-volume-empty-font = 2
bar-volume-empty-foreground = ${colors.foreground}
format-underline = #ffffff

[module/memory2]
type = internal/memory
interval = 10
format = <label>
label =  %gb_used% 
format-prefix = " "
format-prefix-foreground = ${colors.red}

[module/xwindow]
type = internal/xwindow
format = <label>
label = %title:0:40:...%
format-prefix = " "
format-prefix-foreground = ${colors.red}
format-padding = 4

[module/date-fr]
type = custom/script
interval = 1
exec = TZ=Europe/Paris date +"%A %d %b  %{F#ff0000}%{F-} %H:%M:%S"
format-prefix = "  " 
format-prefix-foreground = ${colors.red}

[module/filesystem]
type = internal/fs
interval = 30
mount-0 = /
mount-1 = /home
label-mounted = %{F-} %{F#ff0000} %{F-}%mountpoint% %percentage_used%%
label-unmounted = %mountpoint% not mounted
label-unmounted-foreground = ${colors.foreground-alt}

[module/cpu]
type = internal/cpu
interval = 1
label = %percentage:4%%
format-prefix = 
format-prefix-foreground = ${colors.red}

[module/cpu_load]
type = custom/script
exec = ~/.config/polybar/scripts/cpuloadavg.sh
format-prefix = " "
format-prefix-foreground = ${colors.red}
interval = 10

;[module/temp_core]
;type = internal/temperature
;format = <ramp> <label>
;format-warn = <ramp> <label-warn>
;interval = 1
;label = %temperature%
;label-warn = %temperature%
;label-warn-foreground = ${colors.red}
;ramp-0 = 
;ramp-0-foreground = ${colors.red}
;ramp-1 = 
;ramp-1-foreground = ${colors.red}
;ramp-2 = 
;ramp-2-foreground = ${colors.red}
;ramp-3 = 
;ramp-3-foreground = ${colors.red}
;ramp-4 = 
;ramp-4-foreground = ${colors.red}
;thermal-zone = 1
;warn-temperature = 50

;[module/uptime]
;type = custom/script
;exec = ~/.config/polybar/scripts/uptime.sh
;format-prefix = " "
;format-prefix-foreground = ${colors.red}
;interval = 60

[module/eth]
type = custom/script
exec = ~/.config/polybar/scripts/ethernet.sh
format-prefix = " "
format-prefix-foreground = ${colors.red}
interval = 60

[module/wifi]
type = internal/network
interface = wlp1s0
interval = 5
format-connected-prefix = " "
label-connected = %essid% 
;%quality%% %local_ip% %essid% %signal%dB
format-connected-prefix-foreground = ${colors.red}
format-disconnected-prefix = " "
format-disconnected = " "
format-disconnected-prefix-foreground = ${colors.red}

[module/backlight]
type = custom/script
exec = ~/.config/polybar/scripts/backlight.sh
interval = 0.2
format-prefix = " " 
format-prefix-foreground = ${colors.red}

[module/battery-combined-shell]
type = internal/battery
full-at = 100
battery = BAT1
adapter = ACAD
poll-interval = 5
time-format = %H:%M
interval = 5
format-charging = <animation-charging> <label-charging>
format-discharging = <ramp-capacity> <label-discharging>
format-full = <label-full>
; Available tokens:
;   %percentage% %time% %consumption%
label-charging = %percentage%% %time%
label-discharging = %percentage%% %time%
label-full = %percentage%%
format-full-prefix = " " 
format-full-prefix-foreground = ${colors.red}

ramp-capacity-0 = 
ramp-capacity-0-foreground = ${colors.blue}
ramp-capacity-1 = 
ramp-capacity-1-foreground = ${colors.red}
ramp-capacity-2 = 
ramp-capacity-2-foreground = ${colors.red}
ramp-capacity-3 = 
ramp-capacity-3-foreground = ${colors.red}
ramp-capacity-4 = 
ramp-capacity-4-foreground = ${colors.red}

animation-charging-0 = 
animation-charging-0-foreground = ${colors.red}
animation-charging-1 = 
animation-charging-1-foreground = ${colors.red}
animation-charging-2 = 
animation-charging-2-foreground = ${colors.red}
animation-charging-3 = 
animation-charging-3-foreground = ${colors.red}
animation-charging-4 = 
animation-charging-4-foreground = ${colors.red}
animation-charging-framerate = 500

[module/trash]
type = custom/script
exec = ~/.config/polybar/scripts/trash.sh
format-prefix = " "
format-prefix-foreground = ${colors.red}
interval = 10

[module/temp]
type = custom/script
exec = ~/.config/polybar/scripts/temp.sh
format-prefix = " "
format-prefix-foreground = ${colors.red}
interval = 5

[module/yaourt]
type = custom/script
exec = ~/.config/polybar/scripts/yaourt.sh
format-prefix = " "
format-prefix-foreground = ${colors.red}
interval = 30

[settings]
screenchange-reload = true
compositing-background = xor
;compositing-background = screen
compositing-foreground = source
;compositing-border = over

[global/wm]
margin-top = 0
margin-bottom = 0
