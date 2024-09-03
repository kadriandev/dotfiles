#!/usr/bin/env bash

# Install command-line tools using Homebrew
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

xcode-select --install

# Update and upgrade already-installed formulae
brew update
brew upgrade

# Add taps
brew install --cask sf-symbols
brew tap FelixKratz/formulae

# Install binaries
brew install eza
brew install neovim
brew install tmux
brew install bat
brew install diff-so-fancy
brew install git
brew install nvm
brew install yarn
brew install npm
brew install rename
brew install tree
brew install webp
brew install wget
brew install zsh
brew install ripgrep
brew install zoxide
brew install jq
brew install gh
brew install switchaudio-osx
brew install sketchybar
brew install joshmedeski/sesh/sesh

# Install fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# Nerd Fonts
brew install --cask sf-symbols
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask font-hack-nerd-font
brew install --cask font-fira-code-nerd-font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Install casks
brew install visual-studio-code --cask
brew install wezterm --cask
brew install bitwarden --cask
brew install karabiner-elements --cask
brew install raycast --cask
brew install spotify --cask
brew install obsidian --cask

# Remove outdated versions from the cellar
brew cleanup
