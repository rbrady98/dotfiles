"General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enable filetype plugins
filetype plugin on
filetype indent on

"Set autoread for a when a file is changed from the outside
set autoread

" Must be iMproved
set nocompatible
filetype off

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup and plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'chriskempson/base16-vim'
Plug 'drewtempelmeyer/palenight.vim'

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'w0rp/ale'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor, scroll offset
set so=10

" Turn on wildmenu
set wildmenu

"Ignore compiled files
set wildignore=*.o,*~,*.class,*/.git/*

" Always show current position
set ruler

" Height of command bar
set cmdheight=2

" A buffer becomes hidden if it is abandoned
set hid

" Configure backspace to work as intended
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" Try to be smart about cases
set smartcase

" Highlight search results
set hlsearch


" Make search act more normal
set incsearch

" Dont redraw when executing macros
set lazyredraw

" Turn on for regular expressions
set magic

" Show matching brackets when indicator is hovering
set showmatch
set mat=2

" Turn off error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn on line numbers
set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Enable highlighting
syntax on
set t_Co=256
set background=dark
colorscheme palenight

highlight Pmenu gui=bold
highlight Comment gui=bold
highlight Normal guibg= NONE
highlight VertSplit guifg=grey
let g:palenight_terminal_italics=1

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

" Stuff needed for tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Set extras for gui mode
if has('gui_running')
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 encoding
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off backups
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Text, tabs and indents 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Spaces instead of tabs
set expandtab

" Smart tab use
set smarttab

" tab = 4 spaces
set shiftwidth=4
set tabstop=4

"Linebreak on 500 characters
set lbr
set tw=120

set ai "auto indent
set si "smart indent
set wrap "wrap lines

set cursorline
set relativenumber
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
" Paste options from clipboard
nnoremap <leader>pp "+p
nnoremap <leader>pP o<ESC>"+P
nnoremap <leader>ppn o<ESC>"+p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Motion changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <esc>

nnoremap <TAB> :bnext<cr>
nnoremap <S-TAB> :bprevious<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bracket matching and other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap ' ''<esc>i

imap <C-j> <Esc>/[)}"'\]>]<CR>:nohl<CR>a

nmap <leader>j :nohl<CR>

" Code Folding
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=20
nmap <leader>f za
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline settings
set laststatus=2
set cmdheight=1
set noshowmode
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count =2
let g:airline_theme='onedark'

function! AirlineInit() 
    let g:airline_section_z = airline#section#create(['%#__accent_bold#%l', '/', '%L%#__restore__#', ' : ' , '%c'])
    set statusline^=
endfunction

let g:airline#extensions#ale#enabled = 1
autocmd User AirlineAfterTheme call AirlineInit()
"NERDTree settings
map <leader>t :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeRespectWildIgnore = 1

"Tagbar setting
map <leader>b :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"FZF settings
nmap <C-p> :Files<CR>

" Settings for enhanced cpp highlighting
let g:cpp_class_decl_highlight = 1
let g:python_highlight_all = 1

" Go stuff
let g:go_highlight_build_contraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_def_mapping_enabled = 0

au Filetype go nmap <leader>gt :GoDeclsDir<cr>

set completeopt=longest,menuone

" Settings for echodoc
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'virtual'
let g:echodoc#highlight_arguments = 'Operator'

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

let g:ale_enabled = 1
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
let g:ale_completion_enabled = 0
let g:ale_linters = {
    \ 'python': ['flake8'] ,
    \ 'go': ['golint', 'gopls'] ,
\ }

nnoremap <leader>al :ALEToggle<cr>
let g:ale_virtualtext_cursor = 1
highlight ALEErrorSign guifg=red guibg=None

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting stuff
set listchars=trail:•,tab:>-
set list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle relative line numbers
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else 
        set relativenumber
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
