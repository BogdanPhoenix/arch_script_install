#!/bin/bash

#Зчитування даних користувача
lan="en_US.UTF-8"

clear

read -p "Enter the name of the device: " deviceName

ln -sf /usr/share/zoneinfo/Europe/Kyiv /etc/localtime
hwclock --systohc

sed -i '/en_US.UTF-8\ UTF-8/s/^#//g' /etc/locale.gen
sed -i '/uk_UA.UTF-8\ UTF-8/s/^#//g' /etc/locale.gen
locale-gen

echo "LANG=$lan" >> /etc/locale.conf
echo "KEYPAM=us" >> /etc/vconsole.conf
echo "$deviceName" >> /etc/hostname
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.0.1   $deviceName.localdomain 	$deviceName" >> /etc/hosts

passwd

#Встановлення базових компонентів
pacman -Syu --noconfirm grub efibootmgr dhcpcd dhclient networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools reflector git xdg-utils xdg-user-dirs avahi gvfs gvfs-smb inetutils dnsutils alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol bash-completion acpi_call tlp edk2-ovmf bridge-utils dnsmasq vde2 flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font gdb mc

systemctl enable NetworkManager
systemctl enable sshd
systemctl enable tlp
systemctl enable reflector.timer
systemctl enable fstrim.timer

#Налаштування Grub
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --bootloader-id=GRUB --removable --recheck
grub-mkconfig -o /boot/grub/grub.cfg
