#!/bin/bash

#brother-hll2300d
nameUser="$USER"

clear
echo "brother-hll2300d"
read -p "Enter name printer: " printName

paru -S cups

sudo systemctl enable --now cups
sudo usermod -aG lp $nameUser

paru -S $printName
paru -S system-config-printer
