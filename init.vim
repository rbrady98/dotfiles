set wildmenu
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" Colorschemes
Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim'

Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

" Dependencies for LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

lua require("bian")

let mapleader = " "

imap jj <Esc>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup BIAN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END


set pumheight=20
