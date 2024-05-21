export ZSH="$HOME/.oh-my-zsh"

# Path
export PATH=$PATH:~/go/bin

# FZF command
RG="rg --no-ignore --hidden -g '!.git/'"
export FZF_DEFAULT_COMMAND="$RG ''"
export FZF_CTRL_T_COMMAND="$RG --files """

# Plugins
plugins=(
    git
    sudo
    command-not-found
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases

alias vim='nvim'
alias v='nvim'
alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/dotfiles/.zshrc'

# Exa overrides for ls
alias ls='exa --icons'
alias l='exa -1 --git --icons --sort=type'
alias la='exa -a --git --icons --sort=type'

# Alias for fuzzy finding git branches
alias gsf='git branch | grep -v "^*" | fzf --height=20% --reverse --info=inline | xargs git switch'
alias gcnv='git commit --verbose --no-verify'


# Unbind C-s
bindkey -r "^S"

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bian/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bian/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bian/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bian/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ -s "/Users/bian/.gvm/scripts/gvm" ]] && source "/Users/bian/.gvm/scripts/gvm"

# open tmux session using fzf
tmux_fzf() {
  session=$(tmux ls -F "#S" | fzf --height=15)
  tmux a -t $session
}

# tmux aliases
alias tma=tmux_fzf
alias tmns="tmux new -s"

function nvims() {
  items=("default" "pluton" "lazy")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

alias vp='NVIM_APPNAME=pluton nvim $@'

# pnpm
export PNPM_HOME="/Users/bian/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
