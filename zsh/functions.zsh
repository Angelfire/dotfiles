# Filesystem helpers

# Create one or more directories and change into the last one.
# Usage: mkcd <dir>
mkcd() {
	mkdir -p "$@" && cd "$_"
}

# Clone a Git repository and change into the cloned directory.
# Usage: takegit <repo_url>
takegit() {
	git clone "$1"
	cd "$(basename ${1%%.git})"
}

# Create a project directory, enter it, and initialize Git.
# Usage: takeproj <project_name>
takeproj() {
  mkdir -p "$1" && cd "$1" && git init
}

# Git helpers

# Pull with rebase from origin, defaulting to the current branch.
# Usage: ggpull [branch]
ggpull() {
  git pull --rebase origin "${1:-$(git branch --show-current)}"
}

# Stage all changes and create a commit.
# Usage: gcm "commit message"
gcm() {
  if [[ -z "$1" ]]; then
    echo 'Usage: gcm "commit message"'
    return 1
  fi

  git add -A && git commit -m "$1"
}

# Show a diff summary of the current branch against origin/main.
# Usage: gdiffmain
gdiffmain() {
  git fetch origin main && git diff --stat origin/main...HEAD
}

# Process helpers

# Search running processes by name.
# Usage: psg <process_name>
psg() {
  if [[ -z "$1" ]]; then
    echo 'Usage: psg <process_name>'
    return 1
  fi

  ps aux | grep -i -- "$1" | grep -v grep
}

# Kill processes by name pattern.
# Usage: killp <process_name>
killp() {
  if [[ -z "$1" ]]; then
    echo 'Usage: killp <process_name>'
    return 1
  fi

  pkill -f "$1"
}

# List processes listening on a TCP port.
# Usage: port <port_number>
port() {
  if [[ -z "$1" ]]; then
    echo 'Usage: port <port_number>'
    return 1
  fi

  lsof -nP -iTCP:"$1" -sTCP:LISTEN
}

# Force-kill the process listening on a TCP port.
# Usage: freeport <port_number>
freeport() {
  if [[ -z "$1" ]]; then
    echo 'Usage: freeport <port_number>'
    return 1
  fi

  lsof -tiTCP:"$1" -sTCP:LISTEN | xargs kill -9 2>/dev/null
}

# Archive helpers

# Extract common compressed archive formats.
# Usage: extract <file>
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz) tar xzf "$1" ;;
      *.bz2) bunzip2 "$1" ;;
      *.rar) unrar x "$1" ;;
      *.gz) gunzip "$1" ;;
      *.tar) tar xf "$1" ;;
      *.tbz2) tar xjf "$1" ;;
      *.tgz) tar xzf "$1" ;;
      *.zip) unzip "$1" ;;
      *.7z) 7z x "$1" ;;
      *) echo "'$1' cannot be extracted with extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}