require('lualine').setup {
  options = {
    theme = 'tokyonight',
    color = { gui = 'bold'},
    section_separators = {
      left = '',
      right = ''
    },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'diff', 'diagnostics'},
    lualine_c = {{ 'filename', color = 'Type' }},
    lualine_x = {'filetype'},
    lualine_y = {'searchcount'},
    lualine_z = {'location'}
  }
}
