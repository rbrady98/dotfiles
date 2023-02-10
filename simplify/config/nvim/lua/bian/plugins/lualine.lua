local line_opts = {
  options = {
    theme = 'auto',
    section_separators = {
      left = '',
      right = ''
    },
    component_separators = {
      left = '',
      right = '',
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'diff', 'diagnostics' },
    lualine_c = {'%=', 'filename' },
    lualine_x = { 'filetype' },
    lualine_y = { 'searchcount' },
    lualine_z = { 'location' },
  }
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  },
  event = 'VeryLazy',
  opts = line_opts,
  config = true
}
