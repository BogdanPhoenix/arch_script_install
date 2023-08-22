#!/bin/bash

cd ~
clear

sudo pacman -S --noconfirm flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo flatpak install flathub org.freedesktop.Sdk org.kde.ark com.discordapp.Discord org.telegram.desktop com.obsproject.Studio com.visualstudio.code com.sublimetext.three com.jetbrains.IntelliJ-IDEA-Ultimate com.jetbrains.PyCharm-Professional org.videolan.VLC io.github.jonmagon.kdiskmark org.onlyoffice.desktopeditors org.gnome.World.PikaBackup com.bitwarden.desktop com.google.Chrome com.usebottles.bottles
