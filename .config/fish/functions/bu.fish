function bu --wraps='brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes && mas upgrade' --description 'alias bu brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes && mas upgrade'
  brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes && mas upgrade $argv
        
end
