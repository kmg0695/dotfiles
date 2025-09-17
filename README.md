# kmg0695's dotfiles

This repo contains all the configuration files for setting up my development/daily driver environment on MacOS.

This repo will be continuously updated.

## Setup

> [!Warning]
> `ssh` and any important folders must be imported before running the scripts!

1. Run the following commands

```bash
sudo xcode-select --install
```

```bash
softwareupdate --install-rosetta --agree-to-license
mkdir Developer
cd Developer
git clone https://github.com/kmg0695/dotfiles.git
cd dotfiles
```

2. Then, run the following:

```bash
bash scripts/setup.sh
sudo shutdown -r now
```

## TODO

- [ ] Better documentation
- [ ] Review everything for Tahoe release
- [ ] Get all changed system prefs cuz going to System Preferences is annoying
