#!/bin/bash
set -eix

mac_settings() {
  # macOS Nice UI stuff
  $(command -v defaults) write com.apple.dock autohide -bool true
  $(command -v defaults) write com.apple.dock autohide-delay -float 0
  $(command -v defaults) write com.apple.dock autohide-time-modifier -int 0
  $(command -v defaults) write com.apple.Dock showhidden -bool TRUE
  $(command -v defaults) write -g NSAutomaticWindowAnimationsEnabled -bool false
  $(command -v defaults) write com.apple.dock expose-animation-duration -float 0.1
  $(command -v defaults) write com.apple.dock "mineffect" -string "scale"
  $(command -v defaults) write com.apple.dock "tilesize" -int "48"

  # Finder settings
  $(command -v defaults) write com.apple.finder ShowPathbar -bool true
  $(command -v defaults) write com.apple.finder ShowStatusBar -bool true
  $(command -v defaults) write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  $(command -v defaults) write NSGlobalDomain AppleShowAllExtensions -bool true
  $(command -v defaults) write com.apple.finder AppleShowAllFiles -bool true

  # Aerospace specific commands
  $(command -v defaults) write com.apple.spaces spans-displays -bool true
  $(command -v defaults) write com.apple.dock expose-group-apps -bool true

  # Keyboard niceties
  $(command -v defaults) write NSGlobalDomain ApplePressAndHoldEnabled -bool false
  $(command -v defaults) write NSGlobalDomain KeyRepeat -int 1
  $(command -v defaults) write NSGlobalDomain InitialKeyRepeat -int 15

  # MacOS Terminal stuff
  $(command -v defaults) write com.apple.terminal StringEncodings -array 4
  $(command -v defaults) write com.apple.terminal UnlimitedScrollback -bool true

  # AM Notif turn off (Very annoying)
  $(command -v defaults) write com.apple.Music "userWantsPlaybackNotifications" -bool "false"

  # restart said services
  $(command -v killall) Dock SystemUIServer Finder Safari Music
}

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$(command -v eval) "$(/opt/homebrew/bin/brew shellenv)"

# Install post prerequisites
$(command -v brew) install stow fish

# set fish as default shell
$(command -v echo) /opt/homebrew/bin/fish | sudo tee -a /etc/shells
$(command -v chsh) -s /opt/homebrew/bin/fish

mac_settings

exit
