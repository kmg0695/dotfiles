#!/bin/sh

# Install brew stuff
xargs brew install <./brew/formula.txt
xargs brew install --cask <./brew/casks.txt

# Make some config directories
mkdir -p "$HOME"/.docker/ "$HOME"/.tmux/ "$HOME"/.config/fish/ "$HOME"/.config/kitty/ "$HOME"/Library/Application\ Support/Code/Userfish

# stow
stow .

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

# Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# fzf.fish
fisher install PatrickF1/fzf.fish
fzf_configure_bindings

# autopair.fish
fisher install jorgebucaran/autopair.fish

# catppuccin-mocha
curl -LO --output-dir "$HOME"/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml
# do not forget to set catppucin-mocha theme on kitty

# Conda post-install
conda init "$(basename "$SHELL")"
conda config --set auto_activate_base false

# Final
fish_update_completions
