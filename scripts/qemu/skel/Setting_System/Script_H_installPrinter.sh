#!/bin/bash

#brother-hll2300d
nameUser="$USER"

clear
read -p "Enter name printer: " printName

paru -S --noconfirm cups

sudo systemctl enable --now cups
sudo usermod -aG lp $nameUser

paru -S --noconfirm $printName
paru -S --noconfirm system-config-printer
