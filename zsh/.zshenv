# Set PATH, MANPATH, etc., for Homebrew.
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$XDG_CONFIG_HOME/.config/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export GOPATH=$HOME/projects/go_projects


# ~/.tmux/plugins
export PATH=~/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="`python3 -m site --user-base`/bin:$PATH"
export PATH=$PATH:$GOROOT


