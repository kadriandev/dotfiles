#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    # Install Homebrew formulae
    source scripts/osx.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    source scripts/linux.sh
fi


# Set up symlinks
source ~/.zshenv
source scripts/symlinks.sh

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install Starship Prompt
curl -sS https://starship.rs/install.sh | sh

# Install OhMyZsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Oh My Zsh Custom Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Update settings
source ~/.config/zsh/.zprofile
source ~/.config/zsh/.zshrc

# Install Shell Plugins and Setup
source scripts/shell.sh

# Install node packages
source scripts/node.sh

