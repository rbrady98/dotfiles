-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'echasnovski/mini.nvim' },
    config = function()
      require('nvim-tree').setup()

      vim.keymap.set('n', '<leader>to', '<cmd>NvimTreeToggle<cr>', { desc = '[T]ree [O]pen' })
      vim.keymap.set('n', '<leader>tr', '<cmd>NvimTreeFindFile<cr>', { desc = '[T]ree [R]eveal' })
    end,
  },

  {
    'mfussenegger/nvim-lint',
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
    config = true,
  },
}
