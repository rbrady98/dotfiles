local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  sources = {
    -- Typescript/Javascript settings
    diagnostics.eslint,
    code_actions.eslint,
    formatting.prettier,
  }
})
