local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("i", "jj", "<esc>")

keymap("n", "<space>", "<Nop>")

keymap("n", "<C-d>", "<C-d>zz") -- Scroll down and center the cursor
keymap("n", "<C-u>", "<C-u>zz") -- Scroll up and center the cursor

keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s) -- Format the current buffer using LSP

keymap("v", "<Leader>p", '"_dP') -- Paste without overwriting the default register
keymap("x", "y", [["+y]], s) -- Yank to the system clipboard in visual mode

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights

-- Diagnostic keymaps
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Quick switch to next and previous buffer
keymap("n", "<S-h>", "<cmd>bprevious<cr>")
keymap("n", "<S-l>", "<cmd>bnext<cr>")

-- Keybinds to make split navigation easier.
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

keymap("n", "<leader>ps", "<cmd>lua vim.pack.update()<CR>")

-- Fzf Lua keymaps
keymap("n", "<leader>fb", "<cmd>lua require('fzf-lua').buffers")
keymap("n", "<leader>ff", "<cmd>lua require('fzf-lua').files()<cr>")
keymap("n", "<leader>fgf", "<cmd>lua require('fzf-lua').git_files()<cr>")
keymap("n", "<leader>fr", "<cmd>lua require('fzf-lua').oldfiles()<cr>")
keymap("n", "<leader>fgs", "<cmd>lua require('fzf-lua').git_status()<CR>")
keymap("n", "<leader>sg", "<cmd>lua require('fzf-lua').live_grep()<CR>")

keymap("n", "<leader>bd", "<cmd>lua require('mini.bufremove').delete(0, false)<CR>")

-- lsp keymaps with fzf
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")

keymap("n", "gd", "<cmd>lua require('fzf-lua').lsp_definitions()<CR>")
keymap("n", "grr", "<cmd>lua require('fzf-lua').lsp_references()<CR>")
keymap("n", "gri", "<cmd>lua require('fzf-lua').lsp_implementations()<CR>")
keymap("n", "gD", "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>")
keymap("n", "grs", function()
	require("fzf-lua").lsp_code_actions({ context = { only = { "source" } } })
end)

-- Tree viewer
keymap("n", "<leader>to", "<cmd>NvimTreeToggle<cr>")
keymap("n", "<leader>tr", "<cmd>NvimTreeFindFile<cr>")
