#!/bin/sh

# TODO Finish post setup script

# add brew path to fish
fish_add_path /opt/homebrew/bin
source ~/.config/fish/config.fish

# Install fish config stuff
brew install starship
rm -rfv ~/.config/*
mkdir -p ~/.config/fish

# might just do hardlink?
# cp -rfv ./config/fish/ ~/.config/fish/
# cp -rfv ./config/starship/ ~/.config/

# Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# fzf.fish (Don't forget to set meta in iterm2)
brew install fzf fd bat
fisher install PatrickF1/fzf.fish
fzf_configure_bindings

# brew CLI utils
brew install lsd colima docker docker-completion docker-compose ffmpeg rclone yt-dlp adguard-vpn adobe-acrobat-reader appcleaner \
    calibre cyberduck font-jetbrains-mono-nerd-font handbrake loopback miniconda musicbrainz-picard onyx raycast rectangle shottr \
    soundsource steermouse xld discord

# brew ntfs shenanigans
brew install --cask macfuse
brew install gromgit/fuse/ntfs-3g-mac
brew install --cask mounty

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