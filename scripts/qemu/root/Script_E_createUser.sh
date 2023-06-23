#!/bin/bash

#Створення нового користувача
read -p "Enter your username: " nameUser
read -p "Enter your user password: " passwordUser

sed -i '/%wheel\ ALL=(ALL:ALL)\ ALL/s/^#//g' /etc/sudoers
useradd -m -G wheel -s /bin/bash "$nameUser"
echo "$nameUser":"$passwordUser" | chpasswd

echo "$nameUser"