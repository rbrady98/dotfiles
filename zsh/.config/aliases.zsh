# ====== eza as ls ========
alias ls="eza --icons"
alias ll="eza -lh --icons --git"
alias la="eza -lah --icons --git"
alias tree="eza --tree --icons"

# Reuse ls completions for eza
compdef eza=ls

# ===== bat as cat ======
alias cat='bat'

# ===== zoxide as cd ======
alias cd='z'

# ==== core utils =====
alias grep="rg --color=auto"
alias diff="diff --color=auto"
alias df="df -h"

# ======= navigation ======
alias -- -= "cd -" # -- prevents being parsed as flag

# ====== editor =======
alias v="nvim"

# ====== git =========
alias glog='PAGER="less -F -X" git log'
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
# Alias for fuzzy finding git branches
alias gsf='git branch | grep -v "^*" | fzf --height=20% --reverse --info=inline | xargs git switch'
alias gcnv='git commit --verbose --no-verify'
# simple stuff
alias gst='git status'
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias ga='git add'
alias gc='git commit -v'
alias gp='git push'
alias gsw='git switch'
alias gswc='git switch -c'
alias gd='git diff'
alias gds='git diff --staged'

# ======== Claude Code =======
alias cc='claude'
