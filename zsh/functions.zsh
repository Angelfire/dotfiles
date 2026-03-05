#!/usr/bin/env bash

# Description: Creates a directory and changes into it.
# Parameters:
#   - $@: The name(s) of the directory/directories to be created.
# Usage: mkcd <directory_name>
function mkcd() {
	mkdir -p "$@" && cd "$_";
}

# Description: Starts a simple HTTP server using Python 3's built-in http.server module.
# Parameters:
#   - port (optional): The port number to run the server on. Default is 8000.
function httpserver() {
	local port="${1:-8000}"
	python3 -m http.server "$port"
}

# Description: Opens a file or directory using the default application.
# Parameters:
#   - $@ (optional): The file or directory path to open. If not provided, the current directory will be opened.
function o() {
	if [ $# -eq 0 ]; then
		open .;
	else
		open "$@";
	fi;
}

# Description: Clones a Git repository and navigates into the cloned directory.
# Parameters:
#   $1 - The URL of the Git repository to clone.
function takegit() {
	git clone "$1"
	cd "$(basename ${1%%.git})"
}

# Description: Downloads a tarball from a given URL, extracts it, and navigates into the extracted directory.
# Parameters:
#   - $1: The URL of the tarball to download and extract.
function takeurl() {
	local data thedir
	data="$(mktemp)"
	curl -L "$1" > "$data"
	tar xf "$data"
	thedir="$(tar tf "$data" | head -n 1)"
	rm "$data"
	cd "$thedir"
}

# Create a project folder, enter it, and initialize Git.
# Usage: takeproj <project_name>
takeproj() {
  mkdir -p "$1" && cd "$1" && git init
}

# Stage all changes and create a commit.
# Usage: gcm "commit message"
gcm() {
  if [[ -z "$1" ]]; then
    echo 'Uso: gcm "mensaje"'
    return 1
  fi
  git add -A && git commit -m "$1"
}

# Search running processes by name.
# Usage: psg <process_name>
psg() {
  if [[ -z "$1" ]]; then
    echo 'Uso: psg nombre_proceso'
    return 1
  fi
  ps aux | grep -i -- "$1" | grep -v grep
}

# Kill processes by name pattern.
# Usage: killp <process_name>
killp() {
  if [[ -z "$1" ]]; then
    echo 'Uso: killp nombre_proceso'
    return 1
  fi
  pkill -f "$1"
}

# List processes listening on a TCP port.
# Usage: port <port_number>
port() {
  if [[ -z "$1" ]]; then
    echo "Uso: port 3000"
    return 1
  fi
  lsof -nP -iTCP:"$1" -sTCP:LISTEN
}

# Force-kill the process listening on a TCP port.
# Usage: freeport <port_number>
freeport() {
  if [[ -z "$1" ]]; then
    echo "Uso: freeport 3000"
    return 1
  fi
  lsof -tiTCP:"$1" -sTCP:LISTEN | xargs kill -9 2>/dev/null
}

# Extract common compressed archive formats.
# Usage: extract <file>
extract() {
  if [[ -f "$1" ]]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.7z)      7z x "$1" ;;
      *) echo "'$1' no se puede extraer con extract()" ;;
    esac
  else
    echo "'$1' no es un archivo valido"
  fi
}