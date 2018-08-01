
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$HOME/.dotfiles"
EXTRA_DIR="$HOME/.extra"

# symlinks
ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~

ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore" ~

# Install Packages
source ./install/apps_packages.sh

# Generate ssh key for usage with GitHub
# echo "\n Generating SSH Key..."
# ssh-keygen -t rsa -b 4096 -C "ideans715@gmail.com" && ssh-add ~/.ssh/id_rsa
