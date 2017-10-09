# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Resolve OS
if [ "$(uname -s)" = "Darwin" ]; then
  OS="macOS"
else
  OS=$(uname -s)
fi

#EDITOR=/Applications/Atom.app/Contents/MacOS/Atom

# # Resolves the DOTFILES_DIR
# READLINK=$(which greadlink || which readlink)
#.bash CURRENT_SCRIPT=$BASH_SOURCE
#
# if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
#   SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
#   DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
# elif [ -d "$HOME/.dotfiles" ]; then
# else
#   echo "Unable to find dotfiles, exiting."
#   return # `exit 1` would quit the shell itself
# fi
DOTFILES_DIR="$HOME/.dotfiles"

# source the dotfiles

for DOTFILE in "$DOTFILES_DIR"/system/.{path,prompt,env,aliases,function}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "macOS" ]; then
  for DOTFILE in "$DOTFILES_DIR"/system/.{macos}; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
  done
fi

# Set coloring for ls command
if [ '$OS' = 'Linux' ]; then
  eval "$(dircolors "$DOTFILES_DIR"/system/.dir_colors)"
fi


# source ~/.dotfiles/system/.bash_prompt

# for file in ~/.{bash_prompt}; do
#   [ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;


EXTRA_DIR="$HOME/.extra"

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

source .inputrc

export DOTFILES_DIR OS EXTRA_DIR EDITOR

