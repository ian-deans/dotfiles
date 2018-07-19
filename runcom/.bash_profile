# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Resolve OS
if [ "$(uname -s)" = "Darwin" ]; then
  OS="macOS"
else
  OS=$(uname -s)
fi

# Establish directory variables
DOTFILES_DIR="$HOME/.dotfiles"
EXTRA_DIR="$HOME/.extra"


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
# eval "$(dircolors "$DOTFILES_DIR"/system/.dir_colors)"


# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

source .inputrc

export DOTFILES_DIR OS EXTRA_DIR EDITOR
