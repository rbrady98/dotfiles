export ZSH="$HOME/.oh-my-zsh"

# Path
export PATH=$PATH:~/go/bin

# FZF command
export FZF_DEFAULT_COMMAND='rg --hidden -g "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --files """

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


# Unbind C-s
bindkey -r "^S"

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/bian/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/bian/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/bian/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/bian/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ -s "/Users/bian/.gvm/scripts/gvm" ]] && source "/Users/bian/.gvm/scripts/gvm"
