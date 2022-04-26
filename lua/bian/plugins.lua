-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system
    {'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path}
    print "Installing packer, close and reopen Neovim"
    vim.cmd [[packadd packer.nvim]]
end

-- Autorun packer when this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so that we dont show packer error
local ok, packer = pcall(require, "packer")
if not ok then
  return
end

-- Packer uses a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Packer manages itself
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Colorscheme
  use ({ "catppuccin/nvim", as = "catppuccin" })

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- Completion Plugin
  use "hrsh7th/cmp-buffer" -- Buffer completion
  use "hrsh7th/cmp-path" -- Path completion
  use "hrsh7th/cmp-nvim-lsp" -- LSP completion
  use "saadparwaiz1/cmp_luasnip" -- Snippet completion

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "neovim/nvim-lspconfig" -- Enable LSP
  use "williamboman/nvim-lsp-installer" -- LSP installer
  use "jose-elias-alvarez/null-ls.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Autopairs
  use "windwp/nvim-autopairs"
  
  -- Comments
  use "numToStr/Comment.nvim"

  -- Buffer Bar
  use {
    "romgrk/barbar.nvim",
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Nvim Tree
  use "kyazdani42/nvim-tree.lua"

  -- Gitsigns
  use "lewis6991/gitsigns.nvim"

end)