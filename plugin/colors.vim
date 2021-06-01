if exists('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
let g:tokyonight_style = "night"
colorscheme tokyonight

"hi SignColumn guibg=none
"hi CursorLineNr guibg=none
