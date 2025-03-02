#!/usr/bin/env bash

# Iconos para los estados
ICON_ON=""           # Icono cuando Bluetooth está activado y conectado
ICON_DISCONNECTED="" # Icono cuando Bluetooth está encendido pero no conectado
ICON_OFF="󰂲"          # Icono cuando Bletooth está apagado

# Obtener el estado del Bluetooth
STATUS=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
CONNECTED=$(bluetoothctl info | grep "Connected" | awk '{print $2}')

# Determinar el icono según el estado
if [[ "$STATUS" == "yes" ]]; then
  if [[ "$CONNECTED" == "yes" ]]; then
    ICON=$ICON_ON
  else
    ICON=$ICON_DISCONNECTED
  fi
else
  ICON=$ICON_OFF
fi

# Mostrar el icono en el bloque
echo "$ICON"

# Manejar clics del ratón
case $BLOCK_BUTTON in
1) # Clic izquierdo: abrir Blueman Manager
  blueman-manager >/dev/null 2>&1 &
  ;;
3) # Clic derecho: alternar el estado de Bluetooth (activar/desactivar)
  if [[ "$STATUS" == "yes" ]]; then
    bluetoothctl power off >/dev/null 2>&1 # Apagar Bluetooth
  else
    bluetoothctl power on >/dev/null 2>&1 # Encender Bluetooth
  fi
  ;;
esac
