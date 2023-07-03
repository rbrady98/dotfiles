return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  dependencies = {
    'kyazdani42/nvim-web-devicons'
  },
  opts = {
    options = {
      mode = 'buffers',
      offsets = {
        { filetype = 'NvimTree' }
      },
      show_buffer_close_icons = false,
      always_show_bufferline = false,
      show_close_icon = false
    }
  }
}
