#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Install Caskroom
brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

cask_args appdir: '/Applications'

# Install packages
apps=(
    android-studio
    atom
    dash
    discord
    dropbox
    evernote
    firefox
    firefoxnightly
    flux
    google-chrome
    google-chrome-canary
    google-drive
    java
    psequel
    opera
    iterm2
    screenhero
    slack
    spectacle
    spotify
    utorrent
    webstorm
    vagrant
    visual-studio-code
    virtualbox
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package
