#/bin/bash

valid_choice=false
variant="Gnome (G) or KDE (K) or Cinnamon (C) or Mate (M)"

while [ "$valid_choice" = false ]; do
    read -p "Choose an option: $variant: " choice
    
    case $choice in
        [Gg]*)
            valid_choice=true
            sudo pacman -S xorg xorg-server gnome gnome-extra gdm xdg-desktop-portal xdg-desktop-portal-gnome xdg-desktop-portal-gtk
			systemctl enable gdm
            ;;
        [Kk]*)
            valid_choice=true
            sudo pacman -S xorg xorg-server plasma plasma-wayland-session egl-wayland sddm sddm-kcm packagekit-qt5 xdg-user-dirs konsole xdg-desktop-portal xdg-desktop-portal-kde kate dolphin spectacle gwenview okular
			sudo systemctl enable sddm
            ;;
        [Cc]*)
            valid_choice=true
            sudo pacman -S xorg xorg-server cinnamon
			sudo systemctl enable gdm
            ;;
        [Mm]*)
            valid_choice=true
            sudo pacman -S xorg xorg-server mate mate-extra mate-panel mate-session-manager
			sudo systemctl enable mdm
            ;;
        *)
            echo "Wrong option. Please select $variant."
            ;;
    esac
done

sudo pacman -S pipewire pipewire-media-session pipewire-alsa pipewire-jack pipewire-pulse pipewire-docs qpwgraph pipewire-v4l2 lib32-pipewire lib32-pipewire-jack gparted ark htop cmake
sudo systemctl --user enable pipewire.socket pipewire-pulse.service pipewire-media-session.service

echo "Packeti installed!!!"
