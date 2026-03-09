# ~dotfiles

<img width="1361" height="850" alt="Ghostty + Cliamp" src="https://github.com/user-attachments/assets/ad0cbe7f-e295-4487-be76-e08e86c94118" />

## Fundamental

1. Install [Chrome](https://www.google.com/chrome/), [VSCode](https://code.visualstudio.com/), [Ghostty](https://ghostty.org/download)
2. Install apps `~/Developer/dotfiles/apps`
3. Install brew packages `~/Developer/dotfiles/brew`
4. Install [FiraCode Nerd Font](https://www.nerdfonts.com/font-downloads)

## Configure Git

> (If not available) Install Git through Xcode Command Line Tools `xcode-select --install`

## Brew

1. Install brew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`
2. Install brew packages `~/Developer/dotfiles/brew`

## ZSH

1. Set zsh shell as default with `chsh -s /bin/zsh`
2. Link `zsh/.zshrc` and files from `zsh/` into `~/.zsh` (see `zsh/README.md`)
3. Optional: install `starship` (`brew install starship`) and use [Nerd Font Symbols Preset](https://starship.rs/presets/nerd-font)
