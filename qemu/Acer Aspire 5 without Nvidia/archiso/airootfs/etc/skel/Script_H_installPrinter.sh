#!/bin/bash

#brother-hll2300d
nameUser="$USER"
read -p "Enter name printer: " printName
#Cups
paru -S cups
sudo systemctl enable --now cups
sudo usermod -aG lp $nameUser
paru -S $printName
paru -S system-config-printer
