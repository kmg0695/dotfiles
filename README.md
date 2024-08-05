# kmg0695's dotfiles

This repo contains all the configuration files for setting up my development/daily driver environment on MacOS.

This repo will be continuously updated.

## Run After setup.sh

```sh
# set default to fish
sudo sh -c echo "$(brew --prefix)/bin/fish >> /etc/shells"
chsh -s "$(brew --prefix)"/bin/fish

# add brew path to fish
fish_add_path /opt/homebrew/bin

# install GNU stow
brew install stow

# then execute post.sh
```

## TODO
- [ ] SSH Agent Integration with 1Password
- [ ] Documentation