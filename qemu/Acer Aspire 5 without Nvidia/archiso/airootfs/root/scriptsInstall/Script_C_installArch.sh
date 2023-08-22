#!/bin/bash

directoryScripts="/mnt"
parentsPath="/root/scriptsInstall"

clear

cp "$parentsPath"/Script_D_installBasePackage.sh "$directoryScripts"/Script_D_installBasePackage.sh
cp "$parentsPath"/Script_E_createUser.sh "$directoryScripts"/Script_E_createUser.sh
chmod 744 "$directoryScripts"/*.sh

arch-chroot /mnt ./Script_D_installBasePackage.sh
arch-chroot /mnt ./Script_E_createUser.sh > "$directoryScripts"/name.txt
nameUser=$(cat "$directoryScripts"/name.txt | tr -d '\033' | sed 's/\[H\[J\[3J//')

rm -r "$directoryScripts"/*.sh
rm -r "$directoryScripts"/name.txt

cp -r ../etc/skel/setting/ /mnt/home/"$nameUser"/scripts
chmod 744 /mnt/home/"$nameUser"/scripts/*.sh

genfstab -U /mnt >> /mnt/etc/fstab

umount -a
reboot

