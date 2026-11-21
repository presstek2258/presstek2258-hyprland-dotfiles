#!/bin/bash

choice=$(printf "Shutdown\nReboot\nLogout" | wofi --dmenu --width=266 --height=200 --hide-scroll --prompt "Power")

case "$choice" in
Shutdown)
  systemctl poweroff
  ;;
Reboot)
  systemctl reboot
  ;;
Logout)
  hyprctl dispatch 'hl.dsp.exit()'
  ;;
*)
  exit 0
  ;;
esac
