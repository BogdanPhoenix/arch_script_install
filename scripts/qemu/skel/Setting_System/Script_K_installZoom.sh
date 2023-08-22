#!/bin/bash

valid_choice=false
variant="Gnome (G) or KDE (K)"
desktop_file="/var/lib/flatpak/exports/share/applications/us.zoom.Zoom.desktop"

clear

cd ~
sudo pacman -S --noconfirm pipewire pipewire-media-session pipewire-alsa pipewire-jack pipewire-pulse pipewire-docs qpwgraph pipewire-v4l2 lib32-pipewire lib32-pipewire-jack
systemctl --user enable pipewire.socket pipewire-pulse.service pipewire-media-session.service

while [ "$valid_choice" = false ]; do
    read -p "Choose an option: $variant: " choice
    
    case $choice in
        [Gg]*)
            valid_choice=true
            sudo pacman -S --noconfirm xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk
            ;;
        [Kk]*)
            valid_choice=true
            sudo pacman -S --noconfirm xdg-desktop-portal xdg-desktop-portal-kde
            ;;
        *)
            echo "Wrong option. Please select $variant."
            ;;
    esac
done

systemctl --user enable xdg-desktop-portal
sudo flatpak install flathub us.zoom.Zoom

#Додати даний рядок у файл desktop_file "env XDG_CURRENT_DESKTOP=gnome" перед "us.zoom.Zoom @@u %U @@"
clear
echo "Додати даний рядок у файл $desktop_file \"env XDG_CURRENT_DESKTOP=gnome\" перед \"us.zoom.Zoom @@u %U @@\""
echo "Натисніть будь-яку кнопку..."
read -n 1 -s
