require'bufferline'.setup {
  animation = false,
  closable = false,
  insert_at_end = true
}

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.api'.set_offset(31, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.api'.set_offset(0)
    end
  end
})

-- Custom highlights for BarBar
-- vim.cmd[[hi! link BufferCurrent Type]]
-- vim.cmd[[hi! link BufferCurrentIcon Type]]
-- vim.cmd[[hi! link BufferCurrentIndex Type]]
-- vim.cmd[[hi! link BufferCurrentMod Error]]
-- vim.cmd[[hi! link BufferCurrentSign Type]]
