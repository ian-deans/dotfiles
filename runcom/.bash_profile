# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Resolve OS
OS="macOS"


# # Resolves the DOTFILES_DIR
# READLINK=$(which greadlink || which readlink)
# CURRENT_SCRIPT=$BASH_SOURCE
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

for DOTFILE in "$DOTFILES_DIR"/system/.{function,env,alias,prompt}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Set coloring for ls command
eval "$(dircolors "$DOTFILES_DIR"/system/.dir_colors)"


# source ~/.dotfiles/system/.bash_prompt

# for file in ~/.{bash_prompt}; do
#   [ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;


EXTRA_DIR="$HOME/.extra"

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

export DOTFILES_DIR OS EXTRA_DIR
