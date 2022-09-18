local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
  return
end

configs.setup {
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
  },
  indent = {
    enable = true,
    disable = { "" },
  },
}
