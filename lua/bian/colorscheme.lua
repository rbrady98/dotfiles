local colorscheme = "kanagawa"
local catppuccin = require("catppuccin")

catppuccin.setup({
  styles = {
    functions = {},
    variables = {},
    keywords = {},
  },
  integrations = {
    native_lsp = {
      underlines = {
        errors = {},
        hints = {},
        warnings = {},
        information = {},
      }
    },
  },
})

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Custom color settings
local colors = require("kanagawa.colors").setup()
vim.cmd("highlight WinSeparator guibg=none guifg=" .. colors.oniViolet)
