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
link ~/dotfiles/wezterm ~/.config/wezterm
link ~/dotfiles/taskwarrior ~/.config/taskwarrior
link ~/dotfiles/tmuxinator ~/.config/tmuxinator
link ~/dotfiles/tmux ~/.config/tmux
ln -s ~/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/KadrianCloud ~/obsidian

# mkdir -p ~/.config/tmux
# mkdir -p ~/.config/tmux/plugins
# link ~/dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
# link ~/dotfiles/tmux/plugins/tpm ~/.config/tmux/plugins/tpm

mkdir -p ~/.config/tmux/plugins
link ~/dotfiles/tmux/plugins/tpm ~/.config/tmux/plugins/tpm

link ~/dotfiles/bin/* ~/.local/bin/

if [ "$(uname)" = "Darwin" ]; then
    # Install Homebrew formulae
    link ~/dotfiles/yabai ~/.config/yabai
    link ~/dotfiles/karabiner ~/.config/karabiner
    link ~/dotfiles/skhd ~/.config/skhd
    link ~/dotfiles/sketchybar ~/.config/sketchybar
fi
