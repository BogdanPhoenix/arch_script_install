#!/bin/bash

zshrc_file=".zshrc"

cd ~

paru -S zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

chsh -s /usr/bin/zsh
sudo chsh -s /usr/bin/zsh

zsh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
mv zsh-syntax-highlighting .zsh-syntax-highlighting
echo "source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" \ >> ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo sed -i '2s/^#//' "$zshrc_file"
sudo sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions sudo)/' "$zshrc_file"
source .zshrc

read -p "Create a new user profile for the console. Press Enter to continue..." next