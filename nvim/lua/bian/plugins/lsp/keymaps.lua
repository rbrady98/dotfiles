local M = {}

function M.on_attach()
  local bufmap = function(mode, lhs, rhs)
    local opts = {noremap = true, silent = true, buffer = true}
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  bufmap('n', 'K', '<cmd>Lspsaga hover_doc<cr>')
  bufmap('n', 'gd', '<cmd>Lspsaga goto_definition<cr>')
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  bufmap('n', 'gt', '<cmd>Lspsaga goto_type_definition<cr>')
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  bufmap({'n', 'i'}, '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  bufmap('n', '<leader>rn', '<cmd>Lspsaga rename<cr>')
  bufmap('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>')
  bufmap('x', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
  bufmap('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>')
  bufmap('n', 'dn', '<cmd>Lspsaga diagnostic_jump_next<cr>')
  bufmap('n', 'dp', '<cmd>Lspsaga diagnostic_jump_next<cr>')
  bufmap('n', '<leader>fm', require('bian.plugins.lsp.formatting').lsp_formatting)
end

return M
