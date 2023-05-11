export ZSH="$HOME/.oh-my-zsh"

# FZF command
export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -g ""'

# Plugins

plugins=(
    git
    sudo
    command-not-found
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


# Unbind C-s
bindkey -r "^S"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
