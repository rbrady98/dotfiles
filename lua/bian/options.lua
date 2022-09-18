local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menu", "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = false,
  ignorecase = true,
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 2,
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  termguicolors = true,
  signcolumn = "yes",
  list = true,
  listchars = { trail = '~', tab = '>-' },
  incsearch = true,
  inccommand = "nosplit",
  hlsearch = true,
  laststatus = 3
}

vim.opt.shortmess:append "c"

for k,v in pairs(options) do
  vim.opt[k] = v
end
