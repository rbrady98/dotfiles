DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

# Smarter completion initialization
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

export ZSH="$HOME/.oh-my-zsh"

# Path
export PATH=$PATH:~/go/bin:$HOME/.local/bin

# FZF command
RG="rg --no-ignore --hidden -g '!.git/' -g '!node_modules/'"
FD="fd -H -E 'node_modules/' -E '.git/'"
export FZF_DEFAULT_COMMAND="$RG ''"
export FZF_CTRL_T_COMMAND="$FD -t d ''"

# Plugins
plugins=(
    git
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Aliases

alias vim='nvim'
alias v='nvim'
alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/dotfiles/.zshrc'

# Exa overrides for ls
alias ls='eza --icons'
alias l='eza -1 --git --icons --sort=type'
alias la='eza -a --git --icons --sort=type'

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

# pnpm
export PNPM_HOME="/Users/bian/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
## Set global node memory higher
export NODE_OPTIONS="--max-old-space-size=8192 --no-experimental-strip-types"

source /Users/bian/.daytona.completion_script.zsh

# Claude cant use zoxide
[ -z "$DISABLE_ZOXIDE" ] && eval "$(zoxide init --cmd cd zsh)"

# fnm
FNM_PATH="/opt/homebrew/opt/fnm/bin"
if [ -d "$FNM_PATH" ]; then
  eval "$(fnm env --shell zsh)"
fi
