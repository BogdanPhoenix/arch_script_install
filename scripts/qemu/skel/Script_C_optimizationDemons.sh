#!/bin/bash

cd ~
mkdir demons
cd ./demons
git clone https://aur.archlinux.org/nohang-git.git
cd nohang-git
makepkg -sric
sudo systemctl enable --now nohang-desktop

cd ..
git clone https://aur.archlinux.org/ananicy-git.git
cd ananicy-git
makepkg -sric
sudo systemctl enable ananicy

cd ..
sudo systemctl enable fstrim.timer
sudo fstrim -va /