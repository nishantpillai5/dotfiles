#!/bin/sh

sudo apt install bat tmux fzf git curl ranger tree trash-cli 
# sudo apt install i3 scrot feh imagemagick polybar
# sudo apt install neovim

sudo apt install p7zip-full p7zip-rar

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
