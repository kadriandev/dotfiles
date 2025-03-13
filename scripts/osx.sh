#!/usr/bin/env bash

# Homebrew formulae to install
PACKAGES=(
  aws-cdk awscli eza neovim tmux bat diff-so-fancy git nvm yarn npm rename tree webp wget
  ripgrep zoxide jq gh switchaudio-osx sketchybar joshmedeski/sesh/sesh fzf gum
)

# Homebrew casks to install
CASKS=(
  sf-symbols font-jetbrains-mono-nerd-font bitwarden karabiner-elements raycast spotify obsidian 
  ghostty nikitabobko/tap/aerospace arc jesseduffield/lazydocker/lazydocker
)


# Function to check if a command exists
is_command_installed() {
    command -v "$1" &>/dev/null
}

# Function to check if an application is installed via `mdfind`
is_app_installed() {
    mdfind "kMDItemCFBundleIdentifier == '$1'" | grep -q . 2>/dev/null
}

# Function to check if a Homebrew package is installed
is_brew_package_installed() {
    brew list --formula 2>/dev/null | grep -q "^$1$"
}

# Generic installation function for Homebrew formulae and casks
install_brew() {
    local type=$1
    local name=$2
    local identifier=${3:-}
    shift 3
    case $type in
        formula)
            if ! is_brew_package_installed "$name"; then
                echo "Installing $name..."
                brew install "$name" &
            fi
            ;;
        cask)
            if ! is_app_installed "$identifier"; then
                echo "Installing $name..."
                brew install --cask "$name" "$@" &
            fi
            ;;
        *)
            echo "Unknown type: $type" >&2
            exit 1
            ;;
    esac
}

# Install command-line tools using Homebrew
# Ask for the administrator password upfront
xcode-select --install

# Update and upgrade already-installed formulae
brew update
brew upgrade

# Ensure Zsh is installed and set as default shell
if [[ "$SHELL" != *"zsh"* ]]; then
    echo "Installing Zsh..."
    install_brew formula zsh
    sudo chsh -s /bin/zsh
fi

echo "Installing Homebrew formulae..."
for package in "${PACKAGES[@]}"; do
    install_brew formula "$package"
done

echo "Installing Homebrew casks..."
for cask in "${CASKS[@]}"; do
    install_brew cask "$cask"
done

$(brew --prefix)/opt/fzf/install
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

wait

echo "Setup complete!"

brew cleanup
