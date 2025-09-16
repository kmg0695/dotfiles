#!/bin/bash

# Install brew stuff
$(command -v brew) bundle install --file ../brew/Brewfile

# Make some config directories
$(command -v mkdir) -p "$HOME"/.docker/ "$HOME"/.tmux/ "$HOME"/.config/fish/ "$HOME"/.config/fastfetch "$HOME"/.config/mise

# astronvim setup
$(command -v git) clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
$(command -v rm) -rf ~/.config/nvim/.git

# stow and git restore some items
$(command -v stow) . --adopt
$(command -v git) restore .

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# tmux plugin manager
$(command -v git) clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

# Fisher
# shellcheck source=/dev/null
$(command -v curl) -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && $(command -v fisher) install jorgebucaran/fisher

# fisher plugins
$(command -v fisher) install PatrickF1/fzf.fish && fzf_configure_bindings
$(command -v fisher) install jorgebucaran/autopair.fish
$(command -v fisher) install nickeb96/puffer-fish

# starship preset
$(command -v starship) preset catppuccin-powerline -o ~/.config/starship.toml

# Final
#fish_add_path "$HOME"/go/bin
fish_update_completions

exit
