#!/bin/sh

# TODO Finish setup script

# Install xcode tools
xcode-select --install

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install fish
brew install fish
sudo sh -c echo "$(brew --prefix)/bin/fish >> /etc/shells"
chsh -s "$(brew --prefix)"/bin/fish
fish_add_path /opt/homebrew/bin
source

# Install config stuff
brew install starship
rm -rfv ~/.config/*
mkdir -p ~/.config/fish
cp -rfv ./config/fish/ ~/.config/fish/
cp -rfv ./config/starship/ ~/.config/

# Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# fzf.fish (Don't forget)
brew install fzf fd bat
fisher install PatrickF1/fzf.fish
fzf_configure_bindings

# brew CLI utils
brew install lsd colima docker docker-completion docker-compose ffmpeg rclone yt-dlp adguard-vpn adobe-acrobat-reader appcleaner calibre cyberduck font-jetbrains-mono-nerd-font handbrake loopback miniconda musicbrainz-picard onyx raycast rectangle shottr soundsource steermouse xld

# modern unix aliases
alias ls lsd
alias cat bat
funcsave ls cat

# Conda 
conda init "$(basename "$SHELL")"
conda config --set auto_activate_base false

# docker compose
mkdir -p ~/.docker/cli-plugins
ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose

# Final
fish_update_completions