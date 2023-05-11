local treesitter_opts = {
  ensure_installed = {
    "go",
    "javascript",
    "typescript",
    "ruby",
    "lua",
    "bash",
    "vimdoc",
    "html",
    "json",
    "markdown",
    "markdown_inline",
    "yaml",
  },
  highlight = { enable = true },
  indent = { enable = true },
  autotag = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>"
    }
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
      }
    }
  }
}

return {
  'nvim-treesitter/nvim-treesitter',
  event = "BufReadPre",
  build = ":TSUpdate",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  opts = treesitter_opts,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
