vim.g.mapleader = ' '

vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jj', '<esc>')

vim.opt.laststatus = 3

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Hide initial buffer
vim.opt.hidden = false

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

vim.opt.termguicolors = true

vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See :help 'list'
--  and :help 'listchars'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Set indents to 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.wrap = false

vim.opt.swapfile = false

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quick switch to next and previous buffer
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>')
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(_)
        local gitsigns = require('gitsigns')

        vim.keymap.set('n', ']h', function()
          gitsigns.nav_hunk('next')
        end, { desc = 'Go to next [H]unk' })

        vim.keymap.set('n', '[h', function()
          gitsigns.nav_hunk('prev')
        end, { desc = 'Go to previous [H]unk' })
      end,
    },
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VeryLazy', -- Sets the loading event to 'VeryLazy'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()
    end,
  },

  {
    'ibhagwan/fzf-lua',
    cmd = 'FzfLua',
    opts = function(_, _)
      local config = require('fzf-lua.config')
      local actions = require('fzf-lua.actions')

      -- Quickfix
      config.defaults.keymap.fzf['ctrl-q'] = 'select-all+accept'
      config.defaults.keymap.fzf['ctrl-u'] = 'half-page-up'
      config.defaults.keymap.fzf['ctrl-d'] = 'half-page-down'
      config.defaults.keymap.fzf['ctrl-x'] = 'jump'
      config.defaults.keymap.fzf['ctrl-f'] = 'preview-page-down'
      config.defaults.keymap.fzf['ctrl-b'] = 'preview-page-up'
      config.defaults.keymap.builtin['<c-f>'] = 'preview-page-down'
      config.defaults.keymap.builtin['<c-b>'] = 'preview-page-up'

      return {
        fzf_colors = true,
        fzf_opts = {
          ['--no-scrollbar'] = true,
        },
        defaults = {
          -- formatter = "path.filename_first",
          formatter = 'path.dirname_first',
          file_icons = 'mini',
        },
        lsp = {
          jump1 = true,
          jump1_action = actions.file_edit,
        },
        previewers = {
          builtin = {
            extensions = {
              ['svg'] = { 'chafa', '{file}' },
              ['png'] = { 'chafa', '{file}' },
              ['jpg'] = { 'chafa', '{file}' },
              ['jpeg'] = { 'chafa', '{file}' },
              ['gif'] = { 'chafa', '{file}' },
              ['webp'] = { 'chafa', '{file}' },
            },
          },
        },
        winopts = {
          width = 0.8,
          height = 0.8,
          row = 0.5,
          col = 0.5,
          preview = {
            scrollchars = { '┃', '' },
          },
        },
        files = {
          cwd_prompt = true,
          winopts = { height = 0.30, width = 0.70, preview = { hidden = 'hidden' } },
          actions = {
            ['alt-i'] = { actions.toggle_ignore },
            ['alt-h'] = { actions.toggle_hidden },
          },
        },
        grep = {
          rg_opts = '--column --line-number --no-heading --hidden --color=always -g "!.git" --smart-case --max-columns=4096 -e ',
          actions = {
            ['alt-i'] = { actions.toggle_ignore },
            ['alt-h'] = { actions.toggle_hidden },
          },
        },
      }
    end,
    keys = {
      { '<leader>fb', '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', desc = 'Buffers' },
      { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find Files' },
      { '<leader>fg', '<cmd>FzfLua git_files<cr>', desc = 'Find Files (git-files)' },
      { '<leader>fr', '<cmd>FzfLua oldfiles<cr>', desc = 'Recent' },
      { '<leader>gs', '<cmd>FzfLua git_status<CR>', desc = 'Status' },
      { '<leader>sg', '<cmd>FzfLua live_grep<CR>', desc = 'Status' },
    },
  },

  { 'j-hui/fidget.nvim', opts = {} },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = 'fallback' }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        json = { 'prettierd', 'prettier', stop_after_first = true },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
        svelte = { 'prettierd', 'prettier', stop_after_first = true },
        html = { 'prettierd', 'prettier', stop_after_first = true },
        css = { 'prettierd', 'prettier', stop_after_first = true },
        markdown = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },

  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
      keymap = {
        preset = 'enter',
        ['<C-y>'] = { 'select_and_accept' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },
    },
    opts_extend = { 'sources.default' },
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'night',
        on_colors = function(colors)
          colors.bg = '#000000'
        end,
      })

      vim.cmd.colorscheme('tokyonight')
      vim.api.nvim_set_hl(0, 'CursorLineNr', { link = '@keyword' })
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VeryLazy', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    event = 'VeryLazy',
    config = function()
      require('mini.ai').setup({ n_lines = 500 })
      require('mini.surround').setup()
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

      require('mini.bufremove').setup()

      vim.keymap.set('n', '<leader>bd', function()
        require('mini.bufremove').delete(0, false)
      end, { desc = '[B]uffer [D]elete' })
      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim

      require('mini.tabline').setup({ tabpage_section = 'none' })

      require('mini.pairs').setup({})
      require('mini.icons').setup({})
      MiniIcons.mock_nvim_web_devicons()
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = 'VeryLazy',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
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
        },

        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
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
        },
      })
    end,
  },

  { import = 'custom.plugins' },
}, {})

vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})
vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

vim.diagnostic.config({
  virtual_text = {
    source = true,
    prefix = '● ',
  },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    border = 'rounded',
    source = true,
  },
})

local function with(f, config)
  return function(c)
    return f(vim.tbl_deep_extend('force', config, c or {}))
  end
end

vim.lsp.buf.signature_help = with(vim.lsp.buf.signature_help, {
  border = 'rounded',
  title_pos = 'left',
})

vim.lsp.buf.hover = with(vim.lsp.buf.hover, {
  border = 'rounded',
  title_pos = 'left',
})

-- enable LSPs
vim.lsp.enable({ 'lua_ls', 'gopls', 'ts_ls', 'eslint', 'svelte_ls', 'tailwindcss_ls' })

-- disable default mapping for references
vim.keymap.del('n', 'grr')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = args.buf, desc = 'LSP: ' .. desc })
    end

    map('gd', require('fzf-lua').lsp_definitions, '[G]oto [D]efinition')

    map('grr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')

    map('gI', require('fzf-lua').lsp_implementations, '[G]oto [I]mplementation')

    map('gD', require('fzf-lua').lsp_typedefs, 'Type [D]efinition')

    map('<leader>ca', require('fzf-lua').lsp_code_actions, '[C]ode [A]ction')

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})
