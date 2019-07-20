# Custom prompt for zsh
autoload colors && colors

directory_name() {
    echo -n "%{$fg_bold[red]%}%~ %{$reset_color%}"
}

previous_command_error() {

}

get_username() {
    echo -n "%{$fg_bold[cyan]%}%n%{$reset_color%} in "
}

set_prompt() {
    echo -n "$(directory_name)"
}

set_rprompt() {
    echo -n "$(git_prompt_info)"
}

set_prompt_end() {
     echo -n "\n "
}

build_prompt() {
    set_prompt
}

PROMPT='$(build_prompt)'
RPROMPT='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=''
