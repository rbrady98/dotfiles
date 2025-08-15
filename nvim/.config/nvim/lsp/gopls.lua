return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.work', 'go.mod', '.git' },
  settings = {
    gopls = {
      gofumpt = true,
      staticcheck = true,
      analyses = {
        unusedparam = true,
        nilness = true,
        modernize = true,
        unusedfunc = true,
      },
      directoryFilters = { '-.git', '-.vscode', '-.idea', '-.vscode-test', '-node_modules' },
    },
  },
}
