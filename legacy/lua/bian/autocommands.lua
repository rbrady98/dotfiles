local yank_group = vim.api.nvim_create_augroup("YankHighlightedText", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost",
  { command = "lua vim.highlight.on_yank{ higroup='IncSearch', timeout=300 }",
    group = yank_group
  }
)
