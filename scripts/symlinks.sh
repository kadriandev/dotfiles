#!/usr/bin/env bash

link_file() {
    rm -rf ~/.config/$2
    ln -s ~/dotfiles/$1 ~/.config/$2
}

link() {
    rm -rf ~/.config/$1
    ln -s ~/dotfiles/$1 ~/.config/$1
}

mkdir -p ~/.config/zsh
link_file zsh/zshenv .zshenv
link_file zsh/zshrc zsh/.zshrc
link_file zsh/zprofile zsh/.zprofile
link zsh/modules

link_file zsh/starship.toml starship.toml

link wezterm
link nvim
link taskwarrior

mkdir -p ~/.config/tmux
mkdir -p ~/.config/tmux/plugins
link tmux/tmux.conf
link tmux/plugins/tpm

# link ~/dotfiles/bin/* ~/.local/bin/

if [ "$(uname)" = "Darwin" ]; then
    # Install Homebrew formulae
    link karabiner
    link sketchybar
    link aerospace
fi
