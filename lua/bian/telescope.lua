require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git/",
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({})
    }
  }
}

require("telescope").load_extension("ui-select")
