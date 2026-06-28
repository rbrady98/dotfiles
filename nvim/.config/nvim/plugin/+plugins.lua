vim.pack.add({
  { src = 'https://github.com/rebelot/kanagawa.nvim' },
})

require('kanagawa').setup({
  undercurl = true,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = false },
  statementStyle = { bold = false },
  theme = 'wave',
})

vim.pack.add({
  { src = 'https://github.com/vague2k/vague.nvim' },
})

vim.pack.add({
  { src = 'https://github.com/echasnovski/mini.nvim' },
}, { load = true })

require('mini.ai').setup({ n_lines = 500 })
require('mini.surround').setup()
require('mini.bufremove').setup()
require('mini.tabline').setup({ tabpage_section = 'none' })
require('mini.pairs').setup({})
require('mini.icons').setup({})
MiniIcons.mock_nvim_web_devicons()

require('mini.statusline').setup({
  content = {
    active = function()
      local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
      local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
      local filename = MiniStatusline.section_filename({ trunc_width = 140 })
      local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
      local location = MiniStatusline.section_location({ trunc_width = 75 })
      local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

      return MiniStatusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
        { hl = 'MiniStatuslineDevinfo', strings = { diagnostics } },
        '%<', -- Mark general truncate point
        { hl = 'MiniStatuslineFilename', strings = { filename } },
        '%=', -- End left alignment
        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
        { hl = mode_hl, strings = { search, location } },
      })
    end,
  },
  set_vim_settings = false,
})

vim.pack.add({
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
}, { load = true })

require('gitsigns').setup()

vim.pack.add({
  { src = 'https://github.com/mason-org/mason.nvim' },
}, { load = true })

require('mason').setup({})

vim.pack.add({
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('^1') },
}, { load = true })

local source_priority = {
  lsp = 4,
  snippets = 3,
  path = 2,
  buffer = 1,
}

require('blink.cmp').setup({
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
    sorts = {
      function(a, b)
        -- 1. Explicitly check for struct fields (LSP Kind 5)
        local a_is_field = a.kind == 5
        local b_is_field = b.kind == 5

        if a_is_field and not b_is_field then
          return true
        end
        if not a_is_field and b_is_field then
          return false
        end

        local a_priority = source_priority[a.source_id] or 0
        local b_priority = source_priority[b.source_id] or 0

        if a_priority ~= b_priority then
          return a_priority > b_priority
        end

        -- 3. Return nil to fall through to standard blink sorting
        -- This happens if both are fields, or if they are from the same source
        return nil
      end,

      'score',
      'sort_text',
      'kind',
      'label',
    },
  },
  keymap = {
    preset = 'enter',
  },
  appearance = {
    nerd_font_variant = 'mono',
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
    },
  },
})

vim.pack.add({
  { src = 'https://github.com/ibhagwan/fzf-lua' },
}, { load = true })

local actions = require('fzf-lua.actions')
require('fzf-lua').setup({
  winopts = { backdrop = 85 },
  lsp = {
    jump1 = true,
    jump1_action = actions.file_edit,
  },
  keymap = {
    builtin = {
      ['<C-f>'] = 'preview-page-down',
      ['<C-b>'] = 'preview-page-up',
      ['<C-k>'] = 'toggle-preview',
    },
    fzf = {
      ['ctrl-a'] = 'toggle-all',
      ['ctrl-t'] = 'first',
      ['ctrl-g'] = 'last',
      ['ctrl-d'] = 'half-page-down',
      ['ctrl-u'] = 'half-page-up',
    },
  },
  actions = {
    files = {
      ['ctrl-q'] = actions.file_sel_to_qf,
      ['ctrl-i'] = actions.toggle_ignore,
      ['ctrl-h'] = actions.toggle_hidden,
      ['enter'] = actions.file_edit_or_qf,
    },
  },
  files = {
    winopts = { height = 0.60, preview = { hidden = 'hidden' } },
  },
})
require('fzf-lua').register_ui_select()

vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main', build = ':TSUpdate' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects', version = 'main' },
}, { load = true })

local setup_treesitter = function()
  require('nvim-treesitter-textobjects').setup({
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ap'] = '@parameter.outer',
        ['ip'] = '@parameter.inner',
      },
    },
  })

  local treesitter = require('nvim-treesitter')
  treesitter.setup({})
  local ensure_installed = {
    'bash',
    'html',
    'lua',
    'markdown',
    'vim',
    'vimdoc',
    'go',
    'gosum',
    'gomod',
    'gowork',
    'javascript',
    'typescript',
    'json',
    'tsx',
    'yaml',
    'svelte',
    'gitcommit',
    'diff',
    'git_rebase',
  }

  local config = require('nvim-treesitter.config')

  local already_installed = config.get_installed()
  local parsers_to_install = {}

  for _, parser in ipairs(ensure_installed) do
    if not vim.tbl_contains(already_installed, parser) then
      table.insert(parsers_to_install, parser)
    end
  end

  if #parsers_to_install > 0 then
    treesitter.install(parsers_to_install)
  end

  local group = vim.api.nvim_create_augroup('TreeSitterConfig', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    group = group,
    callback = function(args)
      if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
        vim.treesitter.start(args.buf)
      end
    end,
  })
end

setup_treesitter()

vim.pack.add({
  { src = 'https://github.com/j-hui/fidget.nvim' },
})

require('fidget').setup()

vim.pack.add({
  { src = 'https://github.com/stevearc/conform.nvim' },
}, { load = true })

-- Auto formatting
require('conform').setup({
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = 'fallback' }
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    json = { 'prettier', 'biome', stop_after_first = true },
    javascript = { 'prettier', 'biome', stop_after_first = true },
    typescript = { 'prettier', 'biome', stop_after_first = true },
    javascriptreact = { 'prettier', 'biome', stop_after_first = true },
    typescriptreact = { 'prettier', 'biome', stop_after_first = true },
    svelte = { 'prettier', stop_after_first = true },
    html = { 'prettier', stop_after_first = true },
    css = { 'prettier', stop_after_first = true },
    markdown = { 'prettier', stop_after_first = true },
    yaml = { 'prettier' },
  },
})

-- Linting
vim.pack.add({
  { src = 'https://github.com/mfussenegger/nvim-lint' },
}, { load = true })

require('lint').linters_by_ft = {
  go = { 'golangcilint' },
  svelte = { 'eslint' },
}

vim.pack.add({
  { src = 'https://github.com/windwp/nvim-ts-autotag' },
}, { load = true })
require('nvim-ts-autotag').setup({})

vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
}, { load = true })
require('nvim-tree').setup({})
