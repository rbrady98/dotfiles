return {
  'glepnir/lspsaga.nvim',
  event = 'BufRead',
  opts = {
    diagnostic = {
      on_insert = false,
      show_code_action = false,
      custom_msg = '',
      border_follow = false,
    },
    lightbulb = {
      enable_in_insert = false,
      virtual_text = false,
    },
    symbol_in_winbar = { enable = false },
    beacon = { enable = false },
  },
  depenendencies = {
    'kyazdani42/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter'
  }
}
