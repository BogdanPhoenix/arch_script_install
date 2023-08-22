#!/bin/bash

file="/etc/pacman.d/mirrorlist"

clear

if [ ! -f "$file" ]; then
  echo "Error: The file $file does not exist."
  exit 1
fi

start_line=$(grep -n "## Ukraine" "$file" | cut -d ":" -f 1)
end_line=$(awk -v start="$start_line" 'NR>start && NF==0{print NR;exit}' "$file")
sed -i "$((start_line+1)),$((end_line-1)) s/^#//" "$file"

pacstrap -i /mnt base base-devel linux-zen linux-zen-headers linux-firmware dosfstools btrfs-progs intel-ucode iucode-tool nano git
