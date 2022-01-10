local colorscheme = "catppuccin"
local catppuccin = require("catppuccin")

catppuccin.setup({
  styles = {
    functions = "NONE",
    variables = "NONE",
    keywords = "NONE",
  },
  integrations = {
    native_lsp = {
      underlines = {
        errors = "NONE",
        hints = "NONE",
        warnings = "NONE",
        information = "NONE",
      }
    },
  },
})

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

