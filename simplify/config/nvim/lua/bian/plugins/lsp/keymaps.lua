local M = {}

function M.on_attach()
  local bufmap = function(mode, lhs, rhs)
    local opts = {noremap = true, silent = true, buffer = true}
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  bufmap('n', '<C-m>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  bufmap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
  bufmap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  bufmap('x', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
  bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
  bufmap('n', 'dn', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  bufmap('n', 'dp', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  bufmap('n', '<leader>fm', require('bian.plugins.lsp.formatting').lsp_formatting)
end

return M
