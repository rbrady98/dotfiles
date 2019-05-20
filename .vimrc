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
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/plugins")
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'dracula/vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'connorholyday/vim-snazzy'


call vundle#end()

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
set termguicolors
colorscheme snazzy

highlight Normal guibg= NONE
highlight CursorLineNr guifg=#66B0FF

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
set tw=500

set ai "auto indent
set si "smart indent
set wrap "wrap lines

set cursorline
set relativenumber
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Motion changes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jj <esc>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bracket matching and other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

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
let g:airline_theme='dracula'

function! AirlineInit() 
    let g:airline_section_y = ''
    let g:airline_section_z = airline#section#create(['%#__accent_bold#%l', '/', '%L%#__restore__#', ' : ' , '%c'])
endfunction

autocmd User AirlineAfterTheme call AirlineInit()
"NERDTree settings
map <leader>t :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeRespectWildIgnore = 1

"Tagbar opening setting
map <leader>b :TagbarToggle<CR>
"FZF settings
nmap <C-p> :Files<CR>

" Settings for enhanced cpp highlighting
let g:cpp_class_decl_highlight = 1
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
endfunc
