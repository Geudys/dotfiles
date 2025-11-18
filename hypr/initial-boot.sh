#!/bin/bash

scriptsDir="$HOME/.config/hypr/scripts"
wallpaper="$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"

color_scheme="prefer-dark"
gtk_theme="Flat-Remix-GTK-Blue-Dark"
icon_theme="Flat-Remix-Blue-Dark"
cursor_theme="Bibata-Modern-Ice"

swww="swww img"
effect="--transition-bezier .43,1.19,1,.4 --transition-fps 30 --transition-type grow --transition-pos 0.925,0.977 --transition-duration 2"

if [ ! -f "$HOME/.config/hypr/.initial_startup_done" ]; then
    sleep 1

    if [ -f "$wallpaper" ]; then
        wallust run -s "$wallpaper" > /dev/null
        swww query || swww-daemon && $swww "$wallpaper" $effect
        "$scriptsDir/WallustSwww.sh" > /dev/null 2>&1 &
    fi

    gsettings set org.gnome.desktop.interface color-scheme "$color_scheme" > /dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme" > /dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface icon-theme "$icon_theme" > /dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface cursor-theme "$cursor_theme" > /dev/null 2>&1 &
    gsettings set org.gnome.desktop.interface cursor-size 24 > /dev/null 2>&1 &

    if grep -qi nixos /etc/os-release; then
        gsettings set org.gnome.desktop.interface color-scheme "'$color_scheme'" > /dev/null 2>&1 &
        dconf write /org/gnome/desktop/interface/gtk-theme "'$gtk_theme'" > /dev/null 2>&1 &
        dconf write /org/gnome/desktop/interface/icon-theme "'$icon_theme'" > /dev/null 2>&1 &
        dconf write /org/gnome/desktop/interface/cursor-theme "'$cursor_theme'" > /dev/null 2>&1 &
        dconf write /org/gnome/desktop/interface/cursor-size "24" > /dev/null 2>&1 &
    fi

    touch "$HOME/.config/hypr/.initial_startup_done"
    exit
fi

