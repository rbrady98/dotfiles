return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'williamboman/mason.nvim',
      { 'williamboman/mason-lspconfig.nvim', opts = { ensure_installed = { 'lua_ls' } } },
      'hrsh7th/cmp-nvim-lsp'
    },
    opts = {
      diagnostics = {
        settings = {
          underline = false,
          update_in_insert = false,
          virtual_text = { spacing = 4, prefix='●' },
          severity_sort = true,
          float = {
            focusable = false,
            border = 'single',
            style = 'minimal',
            source = 'always'
          }
        },
        signs = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        }
      },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { 'vim' }
              }

            }
          }
        }
      }
    },
    config = function(_, opts)
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
        vim.lsp.handlers.hover,
        { border = 'single' }
      )

      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
        vim.lsp.handlers.signature_help,
        { border = 'single' }
      )
      -- Diagnostics
      for name, icon in pairs(opts.diagnostics.signs) do
        name = 'DiagnosticSign' .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
      end

      vim.diagnostic.config(opts.diagnostics.settings)

      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      require('mason-lspconfig').setup_handlers({
        function(server_name)
          local setup_opts = vim.tbl_deep_extend('force', {
            capabilities = vim.deepcopy(capabilities),
            on_attach = require('bian.plugins.lsp.keymaps').on_attach
          }, opts.servers[server_name] or {})

          require('lspconfig')[server_name].setup(setup_opts)
        end,

        ['gopls'] = function ()
          local settings = {}
          if opts.servers.gopls then
            settings = opts.servers.gopls.settings
          end

          require('lspconfig').gopls.setup({
            settings = settings,
            capabilities = capabilities,
            on_attach = function (client, bufnr)
              require('bian.plugins.lsp.keymaps').on_attach()
              require('bian.plugins.lsp.formatting').autoformat(client, bufnr)
            end
          })
        end
      })
    end
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'williamboman/mason.nvim' },
    opts = function ()
      local nls = require('null-ls')
      return {
        debug = true,
        sources = {
          -- Go
          nls.builtins.formatting.goimports,
          nls.builtins.diagnostics.golangci_lint,
          -- TS/JS
          nls.builtins.diagnostics.eslint_d,
          nls.builtins.code_actions.eslint_d,
          nls.builtins.formatting.prettier
        }
      }
    end
  },

  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    config = true
  },
}
