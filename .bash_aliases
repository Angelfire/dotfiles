# alias for programs
alias servep="python -m SimpleHTTPServer"
alias subl='open -a "Sublime Text"'

# chdir
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."

# combine mkdir and cd
mkcd () {
  mkdir "$1"
  cd "$1"
}
