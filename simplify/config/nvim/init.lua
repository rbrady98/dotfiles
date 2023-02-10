require("bian")

local augroup = vim.api.nvim_create_augroup
local TheBianGroup = augroup('Bian', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 150,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TheBianGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
