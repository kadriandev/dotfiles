#!/bin/bash

# Replace Command Line Tools
alias ls="eza -1 --icons -l -h --no-time"
alias grep="rg"
alias cat="bat"
alias pip=pip3

# Git aliases
alias gco="git checkout"
alias gnb="git checkout -b"
alias gcm="git commit -m"

# Tmux
t() {
  if [ $# -eq 0 ]; then
    sesh connect $(sesh list | fzf)
  else
    sesh connect $(zoxide query $1) 
  fi
}

alias tmk="tmux kill-session"
alias stmux="tmux source ~/.config/tmux/tmux.conf"
alias tmd="tmux detach"

# ZSH
alias szsh="source ~/.zshenv && source ~/.config/zsh/.zshrc"
