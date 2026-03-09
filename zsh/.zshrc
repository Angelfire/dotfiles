# Shell extensions
[[ -f "$HOME/.zsh/aliases.zsh" ]] && source "$HOME/.zsh/aliases.zsh"
[[ -f "$HOME/.zsh/functions.zsh" ]] && source "$HOME/.zsh/functions.zsh"
[[ -f "$HOME/.zsh/completion.zsh" ]] && source "$HOME/.zsh/completion.zsh"

# Tool integrations
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# History configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Shell behavior
setopt auto_cd # Change directories by typing the directory name.
setopt auto_list # Show completion choices on ambiguous matches.
setopt auto_menu # Enter menu completion automatically.
setopt always_to_end # Move the cursor to the end after a unique completion.
setopt hist_ignore_all_dups # Remove older duplicate history entries.
setopt hist_reduce_blanks # Trim extra blanks from saved history entries.
setopt inc_append_history # Write commands to history as soon as they are entered.
setopt share_history # Share command history across shell sessions.
setopt correct_all # Correct command line spelling mistakes.
setopt interactive_comments # Allow comments in interactive shells.