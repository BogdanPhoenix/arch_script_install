#!/bin/bash

clear

#Створення нового користувача
read -p "Enter your username: " nameUser

sed -i '/%wheel\ ALL=(ALL:ALL)\ ALL/s/^#//g' /etc/sudoers
useradd -m -G wheel -s /bin/bash "$nameUser"
passwd $nameUser

echo $nameUser
