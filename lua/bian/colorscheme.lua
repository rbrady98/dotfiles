local colorscheme = "tokyonight-moon"

require("tokyonight").setup({
  style = "moon"
})

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- Custom color settings
local colors = require("tokyonight.colors").setup()
vim.cmd("highlight WinSeparator guibg=none guifg=" .. colors.magenta)
