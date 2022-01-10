export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="nicoulaj"

# FZF command
export FZF_DEFAULT_COMMAND='rg -l --nogroup --nocolor --hidden -g ""'

#Put node modules in path
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:./node_modules/.bin/

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
)

export ZSH_DISABLE_COMPFIX=true
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
# source ~/dotfiles/zsh/prompt.zsh

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

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rian.brady/google-cloud-sdk/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rian.brady/google-cloud-sdk/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rian.brady/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rian.brady/google-cloud-sdk/google-cloud-sdk/completion.zsh.inc'; fi
