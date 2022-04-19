local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end

local enhance_server_opts = {
  ["cssmodules_ls"] = function(opts)
    opts.init_options = {
      camelCase = false,
    }
    end,
}

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("bian.lsp.handlers").on_attach,
    capabilities = require("bian.lsp.handlers").capabilities,
  }

  if enhance_server_opts[server.name] then
    enhance_server_opts[server.name](opts)
  end

  server:setup(opts)
end)
