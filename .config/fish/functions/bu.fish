function bu --wraps='bash ~/scripts/vuk.sh & && brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes && mas upgrade' --description 'alias bu bash ~/scripts/vuk.sh & && brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes && mas upgrade'
  bash ~/scripts/vuk.sh & && brew upgrade && fisher update && brew cleanup && brew autoremove && conda update --all --verbose --yes && mas upgrade $argv
        
end
