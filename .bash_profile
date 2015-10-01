# Load the shell dotfiles, and then some:
for file in ~/.{bash_prompt,bash_aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Now when you login to your machine from a console .bashrc will be called.
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# mkvirtualenv - virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
