#!/usr/bin/env bash

link() {
    rm -rf $2
    ln -s $1 $2
}

link ~/dotfiles/nvim ~/.config/nvim

mkdir -p ~/.config/zsh
link ~/dotfiles/zsh/zshenv ~/.zshenv
link ~/dotfiles/zsh/zshrc ~/.config/zsh/.zshrc
link ~/dotfiles/zsh/zprofile ~/.config/zsh/.zprofile
link ~/dotfiles/zsh/modules ~/.config/zsh/modules

link ~/dotfiles/zsh/starship.toml ~/.config/starship.toml

link ~/dotfiles/alacritty ~/.config/alacritty

link ~/dotfiles/tmux ~/.config/tmux
link ~/dotfiles/bin ~/.local/bin

if [ "$(uname)" = "Darwin" ]; then
    # Install Homebrew formulae
    link ~/dotfiles/yabai ~/.config/yabai
    link ~/dotfiles/karabiner ~/.config/karabiner
    link ~/dotfiles/skhd ~/.config/skhd
    link ~/dotfiles/sketchybar ~/.config/sketchybar
fi
