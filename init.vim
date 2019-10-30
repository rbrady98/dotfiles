" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Must be iMproved
set nocompatible
filetype off

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
Plug 'junegunn/goyo.vim'

" Syntax files
Plug 'sheerun/vim-polyglot'
call plug#end()

"Enable filetype plugins
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim User Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set 7 lines to the cursor, scroll offset
set so=10

"" turn on wildmenu
set wildmenu

""ignore compiled files
set wildignore=*.o,*~,*.class,*/.git/*

"" always show current position
set ruler

"" height of command bar
set cmdheight=2

"" a buffer becomes hidden if it is abandoned
set hid

"" configure backspace to work as intended
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"" ignore case when searching
set ignorecase

"" try to be smart about cases
set smartcase

"" highlight search results
set hlsearch


"" make search act more normal
set incsearch

"" dont redraw when executing macros
set lazyredraw

"" turn on for regular expressions
set magic

"" show matching brackets when indicator is hovering
set showmatch
set mat=2

"" turn off error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"" turn on line numbers
set number

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"enable highlighting
syntax on
set t_co=256
set background=dark

function! s:patch_color_scheme()
    highlight pmenu gui=bold
    highlight comment gui=bold

    " git gutter highlighting
    hi diffadd      gui=none    guifg=none          guibg=chartreuse4
    hi diffchange   gui=none    guifg=grey          guibg=none
    hi diffdelete   gui=bold    guifg=#ff8080       guibg=red3
    hi difftext     gui=none    guifg=gold3          guibg=none
endfunction

autocmd! colorscheme * call s:patch_color_scheme()
colorscheme palenight

if (has("nvim"))
    let $nvim_tui_enable_true_color=1
endif

if (has("termguicolors"))
    set termguicolors
endif

" stuff needed for tmux
if exists('$tmux')
    let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
endif

" set extras for gui mode
if has('gui_running')
    set guioptions-=t
    set guioptions-=e
    set t_co=256
    set guitablabel=%m\ %t
endif

" set utf8 encoding
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" files and backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" turn off backups
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"text, tabs and indents
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab

set ai
"linebreak on 500 characters
set lbr
set tw=120


set cursorline
set relativenumber
set showcmd

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "
" paste options from clipboard
nnoremap <leader>pp "+p
nnoremap <leader>pp o<esc>"+p
nnoremap <leader>ppn o<esc>"+p
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" motion changes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <esc>

nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :bprevious<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bracket matching and other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap ' ''<esc>i

imap <c-j> <esc>/[)}"'\]>]<cr>:nohl<cr>a

nmap <silent> <leader>j :nohl<cr>

" code folding
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=20
nmap <leader>f za
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline settings
set laststatus=2
set cmdheight=1
set noshowmode
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_min_count =2
let g:airline_theme='palenight'

function! s:airlineinit()
    let g:airline_section_z = airline#section#create(['%#__accent_bold#%l', '/', '%l%#__restore__#', ' : ' , '%c'])
    set statusline^=
endfunction

let g:airline#extensions#ale#enabled = 1
autocmd user airlineaftertheme call airlineinit()
"nerdtree settings
map <leader>t :nerdtreetoggle<cr>
let nerdtreeminimalui = 1
let nerdtreedirarrows = 1
let nerdtreerespectwildignore = 1

"tagbar setting
map <leader>b :tagbartoggle<cr>
let g:tagbar_autofocus = 1

"fzf settings
nmap <c-p> :Files<cr>
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" settings for enhanced cpp highlighting
let g:cpp_class_decl_highlight = 1
let g:python_highlight_all = 1

" go stuff
let g:go_code_completion_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_def_mapping_enabled = 0
let g:go_fmt_fail_silently = 1
let g:go_doc_popup_window = 1

" go colors
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

au filetype go nmap <leader>gt :godeclsdir<cr>

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
let g:ale_linter_aliases = {'jsx': 'css', 'tsx': 'css'}
let g:ale_linters = {
    \ 'python': ['flake8'] ,
    \ 'go': ['golint', 'gopls'] ,
    \ 'javascipt': ['eslint', 'stylelint'],
    \ 'typescript': ['eslint', 'tslint', 'stylelint'],
\ }

let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ }

let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_delay = 100

nnoremap <leader>al :aletoggle<cr>
nnoremap <leader>aln :alenextwrap<cr>
nnoremap <leader>alp :alepreviouswrap<cr>

let g:ale_virtualtext_cursor = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" formatting stuff
set listchars=trail:•,tab:>-
set list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle relative line numbers
function! s:togglenumber()
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
" use tab for trigger completion with characters ahead and navigate.
" use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, `<c-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"

" use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <plug>(coc-diagnostic-prev)
nmap <silent> ]c <plug>(coc-diagnostic-next)

" remap keys for gotos
nmap <silent> gd <plug>(coc-definition)
nmap <silent> gy <plug>(coc-type-definition)
nmap <silent> gi <plug>(coc-implementation)
nmap <silent> gr <plug>(coc-references)

" use k to show documentation in preview window
nnoremap <silent> K :call <sid>show_documentation()<cr>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call cocaction('dohover')
  endif
endfunction

" highlight symbol under cursor on cursorhold
"autocmd cursorhold * silent call cocactionasync('highlight')

" remap for rename current word
nmap <leader>rn <plug>(coc-rename)
let g:coc_global_extensions = ['coc-solargraph']

" custom filetype indentation for ones that dont work
"autocmd filetype html setlocal shiftwidth=2 tabstop=2
"autocmd filetype javascript.jsx setlocal shiftwidth=2 tabstop=2
"autocmd filetype typescript.tsx setlocal shiftwidth=2 tabstop=2

" better splits
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
set splitbelow
set splitright

" neovim specific stuff
if has('nvim')
    set inccommand=nosplit
endif

" fzf
let g:fzf_colors = { 'hl': ['fg', 'keyword'], 'hl+': ['fg', 'keyword'] }
autocmd! filetype fzf
autocmd  filetype fzf set noshowmode noruler nonu

if has('nvim') && exists('&winblend') && &termguicolors
  set winblend=15

  hi normalfloat guibg=none
  if exists('g:fzf_colors.bg')
    call remove(g:fzf_colors, 'bg')
  endif

  if stridx($fzf_default_opts, '--border') == -1
    let $fzf_default_opts .= ' --border'
  endif

  function! Floatingfzf()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  endfunction

  let g:fzf_layout = { 'window': 'call Floatingfzf()' }
endif

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"   :ag  - start fzf with hidden preview window that can be enabled with "?" key
"   :ag! - start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:60%')
  \                         : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \                 <bang>0)

let g:polyglot_disabled = ['go']
autocmd bufnewfile,bufread *.jsx set filetype=javascript.jsx
autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx
