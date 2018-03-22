#!/usr/bin/perl

scalar {
  ALSI_VERSION         => "0.4.7",
  COLORS_FILE          => "/home/david/.config/alsi/alsi.colors",
  DE_FILE              => "/home/david/.config/alsi/alsi.de",
  DEFAULT_COLOR_BOLD   => "red",
  DEFAULT_COLOR_NORMAL => "black",
  DF_COMMAND           => "df -Th -x sys -x tmpfs -x devtmpfs &>/dev/stdout",
  GTK2_RC_FILE         => "/home/david/.gtkrc-2.0",
  GTK3_RC_FILE         => "/home/david/.config/gtk-3.0/settings.ini",
  LOGO_FILE            => "/home/david/.config/alsi/alsi.logo",
  OUTPUT_FILE          => "/home/david/.config/alsi/alsi.output",
  PACKAGES_PATH        => "/var/lib/pacman/local/",
  PS_COMMAND           => "ps -A",
  SCREENSHOT_COMMAND   => "scrot -cd 5",
  USAGE_COLORS         => 0,
  USAGE_COLORS_BOLD    => 0,
  USAGE_PRECENT_GREEN  => 50,
  USAGE_PRECENT_RED    => 100,
  USAGE_PRECENT_YELLOW => 85,
  USE_LOGO_FROM_FILE   => 0,
  USE_VALUES_COLOR     => 0,
  WM_FILE              => "/home/david/.config/alsi/alsi.wm",
}
