#!/usr/bin/env bash

# Menu de encendido y apagado para I3blocks
# - Clic derecho desplegar menu

# Icon
POWER_ICON='󰤆'

case $BLOCK_BUTTON in
3) # clic derecho: apaga la pantalla
  chosen=$(printf "󰐥 Power Off\n Restart\n󰤄 Suspend\n Log out" | rofi -dmenu -i -l 3 -theme android_notification.rasi)
  case "$chosen" in
  "󰐥 Power Off")
    shutdown now
    ;;
  " Restart")
    reboot
    ;;
  "󰤄 Suspend")
    systemctl suspend
    ;;
  " Log out")
    i3-msg exit
    ;;
  *)
    exit 1
    ;;
  esac
  ;;
esac

# Mostrar el porcentaje de brillo
echo "$POWER_ICON "
