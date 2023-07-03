return {
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    lazy = false,
    priority = 1000,
    config = function()
      local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "nightfly",
        callback = function ()
          vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "NightflyTurquoiseMode" })
          vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { link = "NightflyWatermelonMode" })
        end,
        group = custom_highlight
      })

      -- vim.cmd([[colorscheme nightfly]])
    end,
  },
  {
    'catppuccin/nvim', name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      integrations = {
        indent_blankline = {
          enabled = true
        }
      }
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      vim.cmd([[colorscheme catppuccin-mocha]])
    end
  }
}
