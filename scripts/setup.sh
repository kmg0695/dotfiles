#!/bin/bash

mac_settings() {
  # macOS Nice UI stuff
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock autohide-delay -float 0
  defaults write com.apple.dock autohide-time-modifier -int 0
  defaults write com.apple.Dock showhidden -bool TRUE
  defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
  defaults write com.apple.dock expose-animation-duration -float 0.1
  defaults write com.apple.dock "mineffect" -string "scale"
  defaults write com.apple.dock "tilesize" -int "48"

  # Finder settings
  defaults write com.apple.finder ShowPathbar -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # Aerospace specific commands
  defaults write com.apple.spaces spans-displays -bool true
  defaults write com.apple.dock expose-group-apps -bool true

  # move windows using ctrl + cmd
  defaults write -g NSWindowShouldDragOnGesture -bool

  # Keyboard niceties
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  defaults write NSGlobalDomain KeyRepeat -int 1
  defaults write NSGlobalDomain InitialKeyRepeat -int 15

  # MacOS Terminal stuff
  defaults write com.apple.terminal StringEncodings -array 4
  defaults write com.apple.terminal UnlimitedScrollback -bool true

  # Disable Apple Intelligence crap
  defaults write com.apple.CloudSubscriptionFeatures.optIn "545129924" -bool "false"

  # AM Notif turn off (Very annoying)
  defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "false"

  # restart said services
  killall Dock SystemUIServer Finder Safari Music
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
