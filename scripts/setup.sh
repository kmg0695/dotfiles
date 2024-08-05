#!/bin/sh

# Install xcode tools
xcode-select --install

# macOS Nice stuff
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
killall Dock
defaults write com.apple.Dock showhidden -bool TRUE && killall Dock

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Follow the next steps in README"
sleep 5
exit
