#!/bin/bash

cd ~
sudo pacman -S bluez bluez-utils
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

bluetoothctl
power on
agent on
default-agent
scan on

read "Enter MAC address: " macAddress

trust "$macAddress"
pair "$macAddress"
connect "$macAddress"
scan off
exit

echo "Налаштування завершено"