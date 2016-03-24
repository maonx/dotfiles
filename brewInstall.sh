#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install neovim
brew install neovim/neovim/neovim
# Install nevim python3 plugin
# sudo pip3 install neovim

brew install wget
brew install tmux
brew install proxychains-ng
brew install pyenv
# brew install python3
# pyenv install --list
# add -k to set local install,save tgz in $PYENV_ROOT/sources
# pyenv install 3.5.1 -k
# pyenv global 3.5.1
# pyenv rehash
brew install tree


# Install brew cask
brew install brew-cask
#Install Appliations by brew cask
brew cask install qq
brew cask install shadowsocksx
brew cask install neteasemusic
brew cask install cleanmymac
brew cask install the-unarchiver



# Remove outdated versions from the cellar.
brew cleanup
