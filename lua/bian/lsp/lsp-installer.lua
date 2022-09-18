local lsp_installer = require("nvim-lsp-installer")

local lspconfig = require("lspconfig")

local servers = { "tsserver", "jsonls", "cssls", "cssmodules_ls", "gopls" }

lsp_installer.setup {
  ensure_installed = servers
}

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("bian.lsp.handlers").on_attach,
    capabilities = require("bian.lsp.handlers").capabilities,
  }
  lspconfig[server].setup(opts)
end
