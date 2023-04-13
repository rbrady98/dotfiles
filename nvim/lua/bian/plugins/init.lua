return {
  {
    'gruvbox-community/gruvbox',
    lazy = true,
  },
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = true,
  },
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nightfly]])
    end,
  },
}
