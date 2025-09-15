#!/bin/bash

# Install brew stuff
brew bundle install --file ../brew/Brewfile

# Make some config directories
mkdir -p "$HOME"/.docker/ "$HOME"/.tmux/ "$HOME"/.config/fish/ "$HOME"/Library/Application\ Support/Code/User

# astronvim setup
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# stow and git restore some items
stow . --adopt
git restore .

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

# Fisher
# shellcheck source=/dev/null
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# fisher plugins
fisher install PatrickF1/fzf.fish && fzf_configure_bindings
fisher install jorgebucaran/autopair.fish
fisher install nickeb96/puffer-fish

# starship preset
starship preset catppuccin-powerline -o ~/.config/starship.toml

# Final
#fish_add_path "$HOME"/go/bin
fish_update_completions

exit
