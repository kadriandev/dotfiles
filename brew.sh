#!/usr/bin/env bash

# Install command-line tools using Homebrew

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update and upgrade already-installed formulae
brew update
brew upgrade

# Add taps
# brew tap heroku/brew

# Install binaries
brew install exa
brew install neovim
brew install tmux
brew install lazygit
brew install bat
brew install diff-so-fancy
brew install git
brew install nvm
brew install yarn
brew install npm
brew install rename
brew install stow
brew install tree
brew install webp
brew install wget
brew install yarn
brew install zsh
brew install ripgrep
brew install zoxide

# Install casks
# brew cask install slack
brew install visual-studio-code --cask

# Install fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Remove outdated versions from the cellar
brew cleanup
