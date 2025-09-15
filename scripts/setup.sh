#!/bin/bash

mac_settings() {
  # macOS Nice UI stuff
  defaults write com.apple.dock autohide-delay -float 0
  defaults write com.apple.dock autohide-time-modifier -int 0
  defaults write com.apple.Dock showhidden -bool TRUE
  defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

  # Aerospace specific commands
  defaults write com.apple.spaces spans-displays -bool true
  defaults write com.apple.dock expose-group-apps -bool true

  # move windows using ctrl + cmd
  defaults write -g NSWindowShouldDragOnGesture -bool

  # restart said services
  killall Dock
  killall SystemUIServer

}

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

# set fish as default shell
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

mac_settings

# Install post prerequisites
brew install stow fish

exit
