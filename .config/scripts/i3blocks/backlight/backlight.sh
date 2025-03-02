#!/usr/bin/env bash

# Controla el brillo de la pantalla usando `brightnessctl`.
# - Clic derecho apaga la pantalla.
# - Scroll hacia arriba aumenta el brillo.
# - Scroll hacia abajo disminuye el brillo.

# Configuración del tamaño de paso para ajustar el brillo
STEP_SIZE=${STEP_SIZE:-5}

case $BLOCK_BUTTON in
3) xset dpms force off ;;                # clic derecho: apaga la pantalla
4) brightnessctl set "+${STEP_SIZE}%" ;; # scroll arriba: aumenta el brillo
5) brightnessctl set "${STEP_SIZE}%-" ;; # scroll abajo: disminuye el brillo
esac

# Obtener el nivel actual de brillo como un porcentaje
BRIGHTNESS=$(brightnessctl get)
MAX_BRIGHTNESS=$(brightnessctl max)
PERCENTAGE=$((BRIGHTNESS * 100 / MAX_BRIGHTNESS))

# Mostrar el porcentaje de brillo
echo "   ${PERCENTAGE}%"
