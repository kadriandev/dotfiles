eval "$(/opt/homebrew/bin/brew shellenv)"

plugins=(git nvm zsh-autosuggestions zsh-syntax-highlighting)

# Path to your oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh

# Load seperated config files
for conf in "$HOME/.config/zsh/modules/"*.zsh; do
  source "${conf}"
done
unset conf

bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest


# pnpm
export PNPM_HOME="/Users/kmonteir/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(starship init zsh)"

