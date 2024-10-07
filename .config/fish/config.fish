if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
    end
end
# <<< conda initialize <<<

# starship
starship init fish | source

# zoxide
zoxide init fish --cmd cd | source

# mise
/opt/homebrew/opt/mise/bin/mise activate fish | source

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

# force to venv to install packages
set -g -x PIP_REQUIRE_VIRTUALENV true

# This tells fish to run a couple of functions as event handlers --
# that is, to run a function when a variable changes or something similar.
# These functions can't be autoloaded.
#
# See https://fishshell.com/docs/current/language.html#event
#
function __auto_enable_venv --on-variable PWD
    auto_enable_venv
end
