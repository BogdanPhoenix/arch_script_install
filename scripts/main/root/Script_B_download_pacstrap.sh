#/bin/bash
pacstrap -i /mnt base base-devel linux-zen linux-zen-headers linux-firmware dosfstools btrfs-progs intel-ucode iucode-tool nano git

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt