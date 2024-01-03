#!/bin/sh

# TODO Finish setup script

# Install xcode tools
xcode-select --install

# macOS Nice stuff
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
defaults write com.apple.Dock showhidden -bool TRUE && killall Dock

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install fish
brew install fish
sudo sh -c echo "$(brew --prefix)/bin/fish >> /etc/shells"
chsh -s "$(brew --prefix)"/bin/fish

# install iTerm2
brew install iterm2