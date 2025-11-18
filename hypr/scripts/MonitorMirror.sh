#!/bin/bash

# Detectar monitores disponibles
MONITORS=$(hyprctl -j monitors | jq -r '.[].name')

COUNT=$(echo "$MONITORS" | wc -l)

# Ruta del perfil
PROFILE_DIR="$HOME/.config/hypr/Monitor_Profiles"
MIRROR_PROFILE="$PROFILE_DIR/mirror_auto.conf"

# Si solo hay un monitor, reiniciar configuración normal
if [ "$COUNT" -eq 1 ]; then
    hyprctl reload
    exit 0
fi

# Cuando hay 2 o más monitores, crear perfil mirror dinámico
MAIN=$(echo "$MONITORS" | sed -n '1p')
SECONDARY=$(echo "$MONITORS" | sed -n '2p')

# Crear perfil automaticamente
cat > "$MIRROR_PROFILE" << EOF
monitor=$MAIN,preferred,0x0,1
monitor=$SECONDARY,preferred,0x0,1,mirror,$MAIN
EOF

# Aplicar perfil
hyprctl keyword source "$MIRROR_PROFILE"

