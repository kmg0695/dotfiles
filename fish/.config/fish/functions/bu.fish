function bu --wraps='brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes' --description 'alias bu=brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes'
  brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes $argv
        
end
