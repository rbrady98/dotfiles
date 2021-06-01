export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# FZF command
export FZF_DEFAULT_COMMAND='ag -l --nogroup --nocolor --hidden -g ""'

#Set up GOPATH
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin

# Plugins

plugins=(
    docker
    docker-compose
    docker-machine
    git
    kubectl
    django
    sudo
    zsh-autosuggestions
    command-not-found
    zsh-syntax-highlighting
    vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi


# Set custom prompt
source ~/dotfiles/zsh/prompt.zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vim='nvim'
alias v='nvim'
alias mkcd='mkcdir'
alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/dotfiles/.zshrc'
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Set dircolors
eval $(dircolors ~/dotfiles/gruv.dircolors)
