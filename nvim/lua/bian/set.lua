vim.o.mouse = ""

vim.o.cursorline = true

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.number = true
vim.o.relativenumber = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.o.undofile = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.wrap = false

vim.o.updatetime = 250

vim.wo.signcolumn = 'yes'

vim.o.termguicolors = true

vim.o.completeopt = 'menu,menuone,noselect'

vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.g.mapleader = ' '

vim.o.list = true
vim.opt.listchars = { tab = ">-", trail = "~" }

vim.opt.laststatus = 3
vim.o.cmdheight = 0

vim.o.inccommand = 'nosplit'

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.pumheight = 15
