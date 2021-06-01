if exists('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark
let g:tokyonight_style = "night"
let g:tokyonight_italic_comments = 0
let g:tokyonight_italic_keywords = 0
colorscheme tokyonight

"hi SignColumn guibg=none
"hi CursorLineNr guibg=none
