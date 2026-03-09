# ZSH

## Setup

1. Set zsh as default shell:

```bash
chsh -s /bin/zsh
```

2. Link the main config file:

```bash
ln -fs ~/Developer/dotfiles/zsh/.zshrc ~/.zshrc
```

3. Create `~/.zsh` and link modular files used by `.zshrc`:

```bash
mkdir -p ~/.zsh
ln -fs ~/Developer/dotfiles/zsh/aliases.zsh ~/.zsh/aliases.zsh
ln -fs ~/Developer/dotfiles/zsh/functions.zsh ~/.zsh/functions.zsh
ln -fs ~/Developer/dotfiles/zsh/completion.zsh ~/.zsh/completion.zsh
```

4. Reload shell:

```bash
exec zsh
```

## Optional tools

- `starship` for prompt initialization.
- `fnm` for Node.js version management.

Both are auto-detected in `.zshrc` when installed.
