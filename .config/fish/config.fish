if status is-interactive
end

if status is-login
    set -e SSH_AUTH_SOCK
    set -Ux SSH_AUTH_SOCK /Users/grippy/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
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
