# Custom prompt for zsh
autoload colors && colors

directory_name() {
    echo -n "%{$fg_bold[red]%}%c %{$reset_color%}"
}

directory_path() {
    echo -n "%F{024}%~%f"
}

previous_command_error() {
    echo -n "%(?:%{$fg_bold[green]%}⟫ :%{$fg_bold[red]%}⟫ )"
}

get_username() {
    echo -n "%{$fg_bold[cyan]%}%n%{$reset_color%} in "
}

set_prompt() {
    echo -n "$(directory_name)$(previous_command_error)"
}

set_rprompt() {
    echo -n "$(directory_path)$(git_prompt_info)"
}

set_prompt_end() {
     echo -n "\n "
}

build_prompt() {
    set_prompt
}

PROMPT='$(build_prompt)'
RPROMPT='$(set_rprompt)'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=''
