#!/bin/bash

# Install brew stuff
brew bundle install --file ../brew/Brewfile

# Make some config directories
mkdir -p "$HOME"/.docker/ "$HOME"/.tmux/ "$HOME"/.config/fish/ "$HOME"/.config/kitty/ "$HOME"/Library/Application\ Support/Code/User

# stow
stow . --adopt

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

# Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# fzf.fish
fisher install PatrickF1/fzf.fish
fzf_configure_bindings

# autopair.fish
fisher install jorgebucaran/autopair.fish

# Conda post-install
conda init "$(basename "$SHELL")"
conda config --set auto_activate_base false

# Final
fish_update_completions
