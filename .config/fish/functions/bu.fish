function bu --wraps='brew upgrade && fisher update && brew cleanup --prune=all && brew autoremove && mas upgrade && uv self update && mise up' --description 'alias bu brew upgrade && fisher update && brew cleanup --prune=all && brew autoremove && mas upgrade && uv self update && mise up'
  brew upgrade && fisher update && brew cleanup --prune=all && brew autoremove && mas upgrade && uv self update && mise up $argv
        
end
