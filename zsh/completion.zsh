# Completion setup
autoload -Uz compinit
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search

if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

# Completion behavior
zstyle ':completion:*' menu select # Navigate completion menus with arrow keys.
zstyle ':completion:*' group-name '' # Group results by category.
zstyle ':completion:*' use-cache yes # Cache completion results for faster menus.
zstyle ':completion:*' cache-path "$HOME/.zsh/cache" # Store completion cache files in a dedicated directory.
zstyle ':completion:*' verbose yes # Show descriptions for completion groups.
zstyle ':completion:*:descriptions' format '%F{cyan}[%d]%f'
zstyle ':completion:*:warnings' format '%F{red}[no matches found]%f'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Reuse LS_COLORS in completion lists when available.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' # Match case-insensitively and ignore common separators.
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric # Keep typo correction conservative.

# Completion-related key bindings
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search
