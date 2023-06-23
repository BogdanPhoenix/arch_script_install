#!/bin/bash

cd ~

new_value="quiet loglevel=rd.systemd.show_status=auto rd.udev.log_level=0 splash rootfstype=btrfs selinux=0 lpj=3499912 raid=noautodetect noibrs noibpb no_stf_barrier tsx=on tsx_async_about=off elevator=noop mitigations=off nowatchdog nvme_load=YES"
search_pattern="GRUB_CMDLINE_LINUX_DEFAULT="
grub_file="/etc/default/grub"

if [ ! -f "$grub_file" ]; then
    echo "Помилка: файл $grub_file не існує."
    exit 1
fi

line=$(grep "$search_pattern" "$grub_file")

if [ -z "$line" ]; then
    echo "Помилка: не вдалося знайти рядок $search_pattern у файлі $grub_file."
    exit 1
fi

new_line="$search_pattern\"$new_value\""
sudo sed -i "s@^$search_pattern.*@$new_line@" "$grub_file"

sudo grub-mkconfig -o /boot/grub/grub.cfg