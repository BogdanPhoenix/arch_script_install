#!/bin/bash

cd ~
git clone https://aur.archlinux.org/paru-bin
cd paru-bin
makepkg -sricCf

paru -S pamac-all ttf-times-new-roman
