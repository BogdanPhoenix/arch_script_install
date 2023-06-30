#!/bin/bash

cp ./Script_D_installBasePackage.sh /mnt/Script_D_installBasePackage.sh
cp ./Script_E_createUser.sh /mnt/Script_E_createUser.sh
chmod 744 /mnt/*.sh

arch-chroot /mnt ./Script_D_installBasePackage.sh
nameUser=$(arch-chroot /mnt ./Script_E_createUser.sh)

rm /mnt/*.sh

cp -r ../etc/skel/ /mnt/home/"$nameUser"/scripts
chmod 744 /mnt/home/"$nameUser"/scripts/*.sh
chown "$nameUser" /mnt/home/"$nameUser"/scripts/*.sh
chgrp "$nameUser" /mnt/home/"$nameUser"/scripts/*.sh

genfstab -U /mnt >> /mnt/etc/fstab

umount -a
reboot
