# i3
### My I3 config files : i3-gaps + polybar

Conf : 
Arch Linux

NB : for executing sudo cmd in the i3/config file, edit /etc/sudoers file and comment (#) or modify the line :
- Defaults requiretty

With

- Defaults !requiretty

or

- #Defaults requiretty

#### Dependencies :
- i3-gaps-next-git polybar
- feh alsi compton rofi dmenu mpd yay lm_sensors pulseaudio acpi ethtool network-manager siji-git pamixer i3lockmore-git backlight-git arandr 

Soft : pcmanfm firefox chromium thunderbird filezilla libreoffice liferea ristretto ranger terminator rxvt-unicode termite ncmpcpp xautolock numlockx 

Font : awesome-terminal-fonts ttf-font-awesome-4 

Theme : arc-gtk-theme arc-icon-theme

#### How To :
- put alsi/ i3/ polybar/ termite/ in your ~/.config directory
- put the bin/ directory in your ~/ and add /home/USER/bin to your path (i.e in your .bashrc)
Switch theme by typing : blue, red or orange in a terminal
Just need to reload i3 to have the right window border color ($mod+Shift+c in my i3 config file)

- Yay can be replaced by yaourt or trizen, in the yaourt.sh script

 
Blue Nazgul 
![Nazgul](screen_blue.png?raw=true "Blue Nazgul")
  

Orange Hill
![Orange](screen_orange.png?raw=true "Orange Hill")
  

Dark Red
![Red](screen_red.png?raw=true "Red Dark")
  

 
 
 
