#===========
# Functions
#===============

# Pull: defaults to current branch if no argument is given
ggpull() {
  git pull --rebase origin "${1:-$(git branch --show-current)}"
}

# Push: defaults to current branch
ggpush() {
  git push origin "$(git branch --show-current)"
}

# Function: mkcd
# Description: Creates a directory and changes into it.
# Parameters:
#   - $@: The name(s) of the directory/directories to be created.
# Usage: mkcd <directory_name>
function mkcd() {
	mkdir -p "$@" && cd "$_";
}

# Function: takegit
# Description: Clones a Git repository and navigates into the cloned directory.
# Parameters:
#   $1 - The URL of the Git repository to clone.
function takegit() {
	git clone "$1"
	cd "$(basename ${1%%.git})"
}

#===========
# Aliases
#===============
alias gst='git status'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsw='git switch'
alias gswc='git switch -c'

#===========
# Paths
#===============
export PATH="$PNPM_HOME:$PATH"

### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Automatic switch for NVM
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# fnm detect and use node versions on cd
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi

# Starship
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi