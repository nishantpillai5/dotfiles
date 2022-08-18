#!/bin/sh

sudo add-apt-repository ppa:aos1/diff-so-fancy
sudo apt update
sudo apt install bat tmux fzf git curl ranger tree trash-cli diff-so-fancy ripgrep
sudo apt install p7zip-full p7zip-rar
# sudo apt install i3 scrot feh imagemagick polybar pavucontrol
# sudo apt install neovim

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
