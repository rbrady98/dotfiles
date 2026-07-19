export FZF_DEFAULT_COMMAND="fd --type f --hidden --strip-cwd-prefix -E .git -E node_modules"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="
    --height 30% 
    --layout=reverse 
    --border
    --preview 'bat --style=numbers --color=always {}'
"
