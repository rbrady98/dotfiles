return {
  'glepnir/lspsaga.nvim',
  event = 'LspAttach',
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
    ui = {
      border = 'rounded',
      kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind()
    }
  },
  depenendencies = {
    'kyazdani42/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter'
  }
}
