return {
  {
    'nvim-tree/nvim-tree.lua',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.nvim' },
    config = function()
      require('nvim-tree').setup()

      vim.keymap.set('n', '<leader>to', '<cmd>NvimTreeToggle<cr>', { desc = '[T]ree [O]pen' })
      vim.keymap.set('n', '<leader>tr', '<cmd>NvimTreeFindFile<cr>', { desc = '[T]ree [R]eveal' })
    end,
  },

  {
    'mfussenegger/nvim-lint',
    event = 'VeryLazy',
    config = function()
      require('lint').linters_by_ft = {
        go = { 'golangcilint' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup('nvim-lint', { clear = true }),
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    event = 'VeryLazy',
    config = true,
  },

  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      dashboard = {
        sections = {
          { section = 'header' },
          { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
          { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          { section = 'startup' },
        },
      },
    },
  },
}
