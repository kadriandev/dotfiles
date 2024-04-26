# Replace Command Line Tools
alias c="clear"
alias ls="eza -1 --icons -l -h --no-time"
alias grep="rg"
alias v="nvim"
alias pip=pip3


# Git aliases
alias gco="git checkout"
alias gnb="git checkout -b"
alias gcm="git commit -m"

# Tmux
alias tmk="tmux kill-session"
alias stmux="tmux source ~/.config/tmux/tmux.conf"
alias tmd="tmux detach"

# ZSH
alias szsh="source ~/.zshenv && source ~/.config/zsh/.zshrc"

# Yabai + SKHD
alias reload="yabai --restart-service && skhd --reload"
