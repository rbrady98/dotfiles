local M = {}

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

M.lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- Only format using null-ls
      return client.name == 'null-ls'
    end,
    bufnr = bufnr
  })
end

M.autoformat = function(client, bufnr)
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function ()
        M.lsp_formatting(bufnr)
      end
    })
  end
end

return M
