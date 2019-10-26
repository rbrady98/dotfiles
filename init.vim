" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Must be iMproved
set nocompatible
filetype off

"Enable filetype plugins
filetype plugin indent on

"Set autoread for a when a file is changed from the outside
set autoread


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug setup and plugins
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
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'chriskempson/base16-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arzg/vim-corvine'

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'junegunn/goyo.vim'
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

function! s:patch_color_scheme()
    highlight Pmenu gui=bold
    highlight Comment gui=bold

    " Git gutter highlighting
    hi DiffAdd      gui=none    guifg=NONE          guibg=chartreuse4
    hi DiffChange   gui=none    guifg=grey          guibg=NONE
    hi DiffDelete   gui=bold    guifg=#ff8080       guibg=red3
    hi DiffText     gui=none    guifg=gold3          guibg=NONE
endfunction

autocmd! ColorScheme * call s:patch_color_scheme()
colorscheme palenight

if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

" Stuff needed for tmux
if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

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

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

set ai
"Linebreak on 500 characters
set lbr
set tw=120


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

nmap <silent> <leader>j :nohl<CR>

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
let g:airline_theme='palenight'

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
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Settings for enhanced cpp highlighting
let g:cpp_class_decl_highlight = 1
let g:python_highlight_all = 1

" Go stuff
let g:go_code_completion_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1
let g:go_doc_popup_window = 1

" Go Colors
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

au Filetype go nmap <leader>gt :GoDeclsDir<cr>

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
    \ 'javascipt': ['eslint'],
\ }

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 100

nnoremap <leader>al :ALEToggle<cr>
nnoremap <leader>aln :ALENextWrap<cr>
nnoremap <leader>alp :ALEPreviousWrap<cr>

let g:ale_virtualtext_cursor = 1
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
let g:coc_global_extensions = ['coc-solargraph']

" Custom filetype indentation for ones that dont work
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript.jsx setlocal shiftwidth=2 tabstop=2

let g:polyglot_disabled = ['jsx']

" Better splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
set splitbelow
set splitright

" Neovim specific stuff
if has('nvim')
    set inccommand=nosplit
endif

" FZF
let g:fzf_colors = { 'hl': ['fg', 'Keyword'], 'hl+': ['fg', 'Keyword'] }
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=15

  hi NormalFloat guibg=None
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($FZF_DEFAULT_OPTS, '--border') == -1
    let $FZF_DEFAULT_OPTS .= ' --border'
  endif

  function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \                 <bang>0)
