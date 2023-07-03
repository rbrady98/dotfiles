return {
  'lewis6991/gitsigns.nvim',
  keys = {
    { '[g', '<cmd>Gitsigns next_hunk<cr>' },
    { ']g', '<cmd>Gitsigns prev_hunk<cr>' }
  },
  event = "BufReadPre",
  config = true
}
