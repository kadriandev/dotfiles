alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"

function nvims() {
  items=("default" "LazyVim" "NvChad" )
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config="NvChad"
  fi
  NVIM_APPNAME=$config nvim $@
}

bindkey -s ^a "nvims\n"
