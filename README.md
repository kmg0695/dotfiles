# kmg0695's dotfiles

This repo contains all the configuration files for setting up my development/daily driver environment on MacOS.

This repo will be continuously updated.

## Prerequisites

- ssh and any important folders must be imported before running the scripts!

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
fish_add_path /opt/homebrew/sbin

# then execute post.sh
```

## TODO

- [ ] Better documentation
- [ ] Rework setup logic
