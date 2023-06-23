#!/bin/bash

valid_choice=false
variant="Gnome (G) or KDE (K)"
config_file="~/.config/zoomus.conf"
desktop_file="/usr/share/applications/Zoom.desktop"

cd ~
sudo pacman -S pipewire pipewire-media-session pipewire-alsa pipewire-jack pipewire-pulse pipewire-docs qpwgraph pipewire-v4l2 lib32-pipewire lib32-pipewire-jack
sudo systemctl --user enable pipewire.socket pipewire-pulse.service pipewire-media-session.service

while [ "$valid_choice" = false ]; do
    read -p "Choose an option: $variant: " choice
    
    case $choice in
        [Gg]*)
            valid_choice=true
            sudo pacman -S xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk
            ;;
        [Kk]*)
            valid_choice=true
            sudo pacman -S xdg-desktop-portal xdg-desktop-portal-kde
            ;;
        *)
            echo "Wrong option. Please select $variant."
            ;;
    esac
done

systemctl --user enable xdg-desktop-portal
paru -S zoom

zoom
sudo sed -i 's/^enableWaylandShare=.*/enableWaylandShare=true/' "$config_file"
sudo sed -i 's|^Exec=/usr/bin/zoom %U$|Exec=env XDG_CURRENT_DESKTOP=gnome /usr/bin/zoom %U|' "$desktop_file"
zoom