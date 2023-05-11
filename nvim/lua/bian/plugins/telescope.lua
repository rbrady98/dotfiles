return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "Telescope",
  keys = {
    {'<leader>ff', '<cmd>Telescope find_files<CR>'},
    {'<leader>fg', '<cmd>Telescope live_grep<CR>'},
    {'<leader>fb', '<cmd>Telescope buffers<CR>'},
    {'<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<CR>'},
    {'<leader>fr', '<cmd>Telescope oldfiles<CR>'},
    -- git
    {'<leader>gs', '<cmd>Telescope git_status<CR>'},
    {'<leader>gb', '<cmd>Telescope git_branches<CR>'},
  },
  opts = {
    defaults = {
      file_ignore_pattern = { "node_modules" },
      winblend = 15,
      prompt_prefix = " 󰍉  ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8
        },
        vertical = {
          mirror = false
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 100,
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case'
      }
    }
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end
}
