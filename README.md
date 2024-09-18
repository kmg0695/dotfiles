# kmg0695's dotfiles

This repo contains all the configuration files for setting up my development/daily driver environment on MacOS.

This repo will be continuously updated.

## Prerequisites

- ssh Folder must be in Home!

```sh
# Run the following commands
sudo xcode-select --install
softwareupdate --install-rosetta --agree-to-license
mkdir Developer
cd Developer
git clone git@github.com:kmg0695/dotfiles.git
```

## open new terminal and run After setup.sh

```sh
# add brew path to fish
fish_add_path /opt/homebrew/bin

# then execute post.sh
```

## TODO

- [ ] SSH Agent Integration with 1Password
- [ ] Better documentation
