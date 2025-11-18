#!/bin/bash

# Detectar monitores
MONITORS=$(hyprctl -j monitors | jq -r '.[].name')

# Asumir que el interno es el que contiene "eDP"
INTERNAL=$(echo "$MONITORS" | grep -i "edp")

# Si no se encontró interno, salir
[ -z "$INTERNAL" ] && exit 0

# Apagar todos los demás
for M in $MONITORS; do
    if [ "$M" != "$INTERNAL" ]; then
        hyprctl keyword monitor "$M,disable"
    fi
done

# Encender solo el interno
hyprctl keyword monitor "$INTERNAL,preferred,0x0,1"

