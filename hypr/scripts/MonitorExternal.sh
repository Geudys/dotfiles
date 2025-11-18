#!/bin/bash

# Detectar monitores
MONITORS=$(hyprctl -j monitors | jq -r '.[].name')

# Interno = todo lo que contenga eDP
INTERNAL=$(echo "$MONITORS" | grep -i "edp")

# Seleccionar el primer monitor que NO sea eDP
EXTERNAL=$(echo "$MONITORS" | grep -vi "edp" | head -1)

# Si no hay monitor externo, salir
[ -z "$EXTERNAL" ] && exit 0

# Apagar el interno
if [ -n "$INTERNAL" ]; then
    hyprctl keyword monitor "$INTERNAL,disable"
fi

# Encender solo el externo
hyprctl keyword monitor "$EXTERNAL,preferred,0x0,1"

