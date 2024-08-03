#!/bin/sh

# Install fish config stuff
brew install starship

# Make some config directories
mkdir -p "$HOME"/.config/fish/ "$HOME"/Library/Application\ Support/Code/User/ "$HOME"/.config/alacritty/

# Hardlink config files
ln ./config/fish/config.fish "$HOME"/.config/fish/config.fish
ln ./config/starship/starship.toml "$HOME"/.config/starship.toml
ln ./config/alacritty/alacritty.toml "$HOME"/.config/alacritty/alacritty.toml
ln ./config/vim/.vimrc "$HOME"/.vimrc
ln ./config/vscode/settings.json "$HOME"/Library/Application\ Support/Code/User/settings.json

# Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# fzf.fish (Don't forget to set left option key to Esc+ in iterm2 -> Settings -> Profiles -> Keys)
brew install fzf fd bat
fisher install PatrickF1/fzf.fish
fzf_configure_bindings

# autopair.fish
fisher install jorgebucaran/autopair.fish

# brew CLI utils
brew install btop colima docker docker-compose ffmpeg go gromgit/fuse/ntfs-3g-mac hugo lsd mailsy mise neovim r rclone \
    teamookla/speedtest/speedtest wget yt-dlp zoxide

# brew cask install
brew install --cask 1password 1password-cli adguard-vpn adobe-acrobat-reader alacritty appcleaner calibre cyberduck discord \
    font-jetbrains-mono-nerd-font google-chrome@dev handbrake knockknock loopback macfuse miniconda mos mounty musicbrainz-picard \
    obsidian onyx raycast rectangle shottr soundsource steermouse utm visual-studio-code vlc vnc-viewer xld zed

# catppuccin-mocha
curl -LO --output-dir "$HOME"/.config/alacritty https://github.com/catppuccin/alacritty/raw/main/catppuccin-mocha.toml

# modern unix aliases
alias ls lsd --save
alias l "ls -l" --save
alias la "ls -a" --save
alias lla "ls -la" --save
alias lt "ls --tree" --save
alias cat bat --save

# system upgrade alias
alias bu "brew upgrade --verbose && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes" --save

# Conda post-install
conda init "$(basename "$SHELL")"
conda config --set auto_activate_base false

# Final
fish_update_completions