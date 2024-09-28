#!/bin/bash

git config --global alias.co "checkout"
git config --global alias.new-branch "checkout -b"
git config --global alias.graph "log --all --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.undo "reset --soft HEAD^"
git config --global alias.last 'log -1 HEAD --stat'
