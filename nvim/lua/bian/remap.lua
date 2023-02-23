local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

-- Remap space to leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap({'n', 'v'}, '<Space>', '<Nop>', { silent = true })

keymap('i', 'jj', '<ESC>')

-- Moving in insert mode
keymap('v', 'J', ":m '>+1<CR>gv=gv")
keymap('v', 'K', ":m '<-2<CR>gv=gv")

-- Join without moving cursor
keymap('n', 'J', 'mzJ`z')

keymap('n', '<C-d>', '<C-d>zz')
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', 'n', 'nzzzv')
keymap('n', 'N', 'Nzzzv')

keymap('x', '<leader>p', '\'_dP')

keymap('n', '<leader>y', '\'+y')
keymap('n', '<leader>Y', '\'+Y')
keymap('v', '<leader>y', '\'+y')

keymap('n', 'Q', '<nop>')

-- Normal --
-- Better window navigation --
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Better window navigation --
keymap('n', '<Tab>', ':bnext<CR>', opts)
keymap('n', '<S-Tab>', ':bprevious<CR>', opts)
