#!/bin/bash

# Rosetta
softwareupdate --install-rosetta --agree-to-license

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# install prerequisites
brew install stow fish

# set fish as default shell
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# macOS Nice stuff
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.Dock showhidden -bool TRUE
killall Dock

sleep 5
exit
