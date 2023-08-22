#!/bin/bash

clear

cd ~
sudo pacman -S --noconfirm bluez bluez-utils
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service

# Функція для взаємодії з bluetoothctl
configure_bluetoothctl() {
    echo -e "power on\nagent on\ndefault-agent\nscan on" | bluetoothctl
}

configure_bluetoothctl

read -p "Enter MAC address: " macAddress

# Знаходимо пристрій за MAC-адресою
device_info=$(echo -e "info $macAddress" | bluetoothctl)
echo "$device_info"

# Перевіряємо, чи пристрій вже спарений
if [[ "$device_info" == *"Paired: yes"* ]]; then
    echo "Device is already paired."
else
    # Якщо пристрій ще не спарений, спробуємо спарити його
    echo -e "trust $macAddress\npair $macAddress\nconnect $macAddress" | bluetoothctl
fi

# Вимикаємо сканування після завершення налаштувань
echo -e "scan off\nexit" | bluetoothctl

echo "Налаштування завершено"
