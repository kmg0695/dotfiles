if status is-interactive
end

# starship
starship init fish | source

# zoxide
zoxide init fish --cmd cd | source

# mise
/opt/homebrew/opt/mise/bin/mise activate fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
