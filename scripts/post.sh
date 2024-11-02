#!/bin/bash

# Install brew stuff
brew bundle install --file ../brew/Brewfile

# Make some config directories
mkdir -p "$HOME"/.docker/ "$HOME"/.tmux/ "$HOME"/.config/fish/ "$HOME"/.config/kitty/ "$HOME"/Library/Application\ Support/Code/User

# stow
# astronvim setup
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

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
fish_add_path "$HOME"/go/bin
fish_update_completions
