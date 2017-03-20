#!/bin/bash

# Installs Homebrew and some of the common dependencies needed/desired for software development

# Ask for the administrator password upfront
sudo -v

# Check for Homebrew and install it if missing
if test ! $(which brew)
then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap homebrew/core
brew tap homebrew/dupes
brew tap homebrew/bundle


# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade --all

# Install packages listed in Brewfile
brew bundle

# Remove outdated versions from the cellar
brew cleanup

if [ $OS = 'macOS' ]; then
  . ~/.dotfiles/homebrew/brew-cask.#!/bin/sh
fi
