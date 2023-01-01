#!/bin/sh

sudo add-apt-repository ppa:aos1/diff-so-fancy
sudo apt update

sudo apt install -y bat tmux fzf git curl ranger tree trash-cli diff-so-fancy ripgrep ncdu
# Install tpm, tmux plugin manager
sudo apt install -y p7zip-full p7zip-rar
# if GUI prompt
# sudo apt install -y i3 scrot feh imagemagick polybar pavucontrol maim xdotool xclip

# Prompt install miniconda

# python3 -m pip install --user pipx
# python3 -m pipx ensurepath
# sudo apt install python3.10-venv
# pipx install powerline-shell
# pipx install rich-cli

# Node.js
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
# nvm install node
# nvm use node
# npm install --global yarn

# Python Juypter PDF export
# sudo apt-get install pandoc texlive-xetex texlive-fonts-recommended texlive-plain-generic

# Get latest neovim instead
# Auto PlugInstall
# sudo apt install -y neovim

# LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
# Download in downloads, delete after
# curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
# sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit

# Local scripts
mkdir -p ~/.local/bin
[ ! -f "~/.local/bin/bat"] && ln -s /usr/bin/batcat ~/.local/bin/bat
