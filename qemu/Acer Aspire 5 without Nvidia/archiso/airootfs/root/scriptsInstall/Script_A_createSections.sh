#!/bin/bash

valid_disk=false

fdisk -l

while [ "$valid_disk" = false ]; do
    # Запитуємо у користувача назву блоку диску
    read -p "Enter the name of the disk block: " block_device

    # Перевіряємо, чи існує введений диск
    if [ -b "$block_device" ]; then
        valid_disk=true
    else
        echo "The disk name is incorrect. Please try again."
    fi
done

# Виводимо повідомлення з використанням назви блоку диску
echo "The drive is back!"


# Створюємо розділи
parted -s "$block_device" mklabel gpt
parted -s "$block_device" mkpart primary 1MiB 129MiB set 1 bios_grub on
parted -s "$block_device" mkpart primary 129MiB 641MiB set 2 esp on
parted -s "$block_device" mkpart primary 641MiB 100%

# Форматуємо розділи
mkfs.vfat "${block_device}2"
mkfs.btrfs -f "${block_device}3"

# Виводимо інформацію про створені розділи
parted -s "$block_device" print

fdisk -l "$block_device"

#Монтування розділів
echo "Mounting partitions"

mount "${block_device}3" /mnt
mkdir -p /mnt/boot/EFI
mount "${block_device}2" /mnt/boot/EFI

