#!/bin/sh

sudo add-apt-repository ppa:aos1/diff-so-fancy
sudo apt update

sudo apt install -y bat tmux fzf git curl ranger tree trash-cli diff-so-fancy ripgrep
# Install tpm, tmux plugin manager
sudo apt install -y p7zip-full p7zip-rar
# if GUI prompt
# sudo apt install -y i3 scrot feh imagemagick polybar pavucontrol maim

# Prompt install miniconda

# Get latest neovim instead
# Auto PlugInstall
# sudo apt install -y neovim
 
# python3 -m pip install --user pipx
# python3 -m pipx ensurepath
# sudo apt install python3.10-venv
# pipx install powerline-shell
# pipx install rich-cli

# Local scripts
mkdir -p ~/.local/bin
[ ! -f "~/.local/bin/bat"] && ln -s /usr/bin/batcat ~/.local/bin/bat
