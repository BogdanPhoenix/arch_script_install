#!/bin/bash

valid_choice=false
variant="Intel (I) or AMD (A)"

while [ "$valid_choice" = false ]; do
    read -p "Choose an option: $variant: " choice
    
    case $choice in
        [Ii]*)
            valid_choice=true
            sudo pacman -Syu lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader libva-intel-driver xf86-video-intel
            ;;
        [Aa]*)
            valid_choice=true
            sudo pacman -Syu lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
            ;;
        *)
            echo "Wrong option. Please select $variant."
            ;;
    esac
done

echo "Packeti installed!!!"
