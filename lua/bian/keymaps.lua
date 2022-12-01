-- Modes
--  normal = "n",
--  insert = "i",
--  visual = "v",
--  visual_block = "x",
--  command_mode = "c",

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap


-- Remap space to leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Normal --
-- Better window navigation --
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better window navigation --
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Telescope binds
keymap("n", "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", opts)
keymap("n", "<leader>gst", "<cmd>Telescope git_status<cr>", opts)

-- Strip whitespace
keymap("n", "<F5>", [[m`:%s/\s\+$//e<cr>``]], opts)

-- Clear search highlight
keymap("n", "<C-space>", ":nohl<cr>", { silent = true })

-- Insert --
-- Better window navigation --
keymap("i", "jj", "<ESC>", opts)


-- Visual --
-- Stay in indent mode --
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
--keymap("v", "<A-j>", ":m .+1<CR>==", opts)
--keymap("v", "<A-k>", ":m .-2<CR>==", opts)


-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Jump to next match centers
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Join line keeps cursor at same position
keymap("n", "J", "mzJ`z", opts)

-- Buffer Close
keymap("n", "<leader>bd", ":BufferClose<CR>", opts)
