local ok, _ = pcall(require, "lspconfig")
if not ok then
  return
end

require("bian.lsp.lsp-installer")
require("bian.lsp.null-ls")
require("bian.lsp.handlers").setup()
