local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end


lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("bian.lsp.handlers").on_attach,
    capabilities = require("bian.lsp.handlers").capabilities,
  }

  server:setup(opts)
end)
