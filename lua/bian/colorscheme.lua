local colorscheme = "carbonfox"
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

vim.cmd[[highlight WinSeparator guibg=none]]
