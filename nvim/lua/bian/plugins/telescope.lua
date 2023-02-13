return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = "Telescope",
  keys = {
    {'<leader>ff', '<cmd>Telescope find_files<CR>'},
    {'<leader>fg', '<cmd>Telescope live_grep<CR>'},
    {'<leader>fb', '<cmd>Telescope buffers<CR>'},
    {'<leader>fr', '<cmd>Telescope old_files<CR>'},
    -- git
    {'<leader>gs', '<cmd>Telescope git_status<CR>'},
  },
  opts = {
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
