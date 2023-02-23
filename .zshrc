export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
# FZF command
export FZF_DEFAULT_COMMAND='rg -l --nogroup --nocolor --hidden -g ""'

#Put node modules in path
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH:$GOBIN

export PATH=$PATH:./node_modules/.bin/
export PATH=/opt/homebrew/bin:$PATH

# Plugins

plugins=(
    docker
    docker-compose
    docker-machine
    git
    kubectl
    sudo
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


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vim='nvim'
alias v='nvim'
alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/dotfiles/.zshrc'
alias ktx='kubectx'
alias kns='kubens'
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# autoload -Uz compinit
# compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
    [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Exa overrides for ls
alias ls='exa'
alias l='exa -lbF --git --icons --sort=type'
alias la='exa -lbFa --git --icons --sort=type'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rian.brady/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rian.brady/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rian.brady/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rian.brady/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# use for new gcloud auth
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

eval "$(starship init zsh)"
