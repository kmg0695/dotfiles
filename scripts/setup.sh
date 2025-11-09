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

fish <<'END'
  fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
END

mac_settings

# Install brew stuff
$(command -v brew) bundle install --file brew/Brewfile --verbose

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
fish <<'END'
  fish_add_path ~/.local/bin
  echo 'uv generate-shell-completion fish | source' > ~/.config/fish/completions/uv.fish
  echo 'uvx --generate-shell-completion fish | source' > ~/.config/fish/completions/uvx.fish
END

# tmux plugin manager
$(command -v git) clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm
mkdir -p ~/.config/tmux/plugins/catppuccin
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
~/.tmux/plugins/tpm/bin/install_plugins

# Fisher
fish <<'END'
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish
  source
  fisher install jorgebucaran/fisher
  fisher install PatrickF1/fzf.fish
  fzf_configure_bindings
  fisher install jorgebucaran/autopair.fish
END

# starship preset
$(command -v starship) preset nerd-font-symbols -o ~/.config/starship.toml

# Final
fish <<'END'
  fish_update_completions
  set -Ux SSH_AUTH_SOCK /Users/$USER/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
END

exit
