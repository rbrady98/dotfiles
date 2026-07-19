-- vim.lsp.enable({ 'lua_ls', 'gopls', 'tsgo', 'eslint', 'svelte_ls', 'tailwindcss', 'biome', 'cssls' })
vim.lsp.enable({ 'lua_ls', 'gopls', 'tsgo', 'eslint', 'svelte_ls', 'tailwindcss', 'cssls', 'tofu_ls' })

vim.diagnostic.config({
  virtual_text = {
    enabled = true,
    prefix = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return '🭰× '
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return '🭰▲ '
      else
        return '🭰• '
      end
    end,
    suffix = '🭵',
  },
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ×',
      [vim.diagnostic.severity.WARN] = ' ▲',
      [vim.diagnostic.severity.HINT] = ' •',
      [vim.diagnostic.severity.INFO] = ' •',
    },
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = true,
    border = 'rounded',
    source = true,
  },
})
