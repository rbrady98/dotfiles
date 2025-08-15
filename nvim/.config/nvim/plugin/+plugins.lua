vim.pack.add({
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
})

require("nightfox").setup({ options = { transparent = true } })

vim.pack.add({
	{ src = "https://github.com/echasnovski/mini.nvim" },
}, { load = true })

require("mini.ai").setup({ n_lines = 500 })
require("mini.surround").setup()
require("mini.bufremove").setup()
require("mini.tabline").setup({ tabpage_section = "none" })
require("mini.pairs").setup({})
require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons()

require("mini.statusline").setup({
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
				{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end,
	},
	set_vim_settings = false,
})

vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
}, { load = true })

require("gitsigns").setup()

vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
}, { load = true })

require("mason").setup({})

vim.pack.add({
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
}, { load = true })

require("blink.cmp").setup({
	fuzzy = { implementation = "prefer_rust_with_warning" },
	keymap = {
		preset = "enter",
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},
})

vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
}, { load = true })

local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
	winopts = { backdrop = 85 },
	lsp = {
		jump1 = true,
		jump1_action = actions.file_edit,
	},
	keymap = {
		builtin = {
			["<C-f>"] = "preview-page-down",
			["<C-b>"] = "preview-page-up",
			["<C-k>"] = "toggle-preview",
		},
		fzf = {
			["ctrl-a"] = "toggle-all",
			["ctrl-t"] = "first",
			["ctrl-g"] = "last",
			["ctrl-d"] = "half-page-down",
			["ctrl-u"] = "half-page-up",
		},
	},
	actions = {
		files = {
			["ctrl-q"] = actions.file_sel_to_qf,
			["ctrl-i"] = actions.toggle_ignore,
			["ctrl-h"] = actions.toggle_hidden,
			["enter"] = actions.file_edit_or_qf,
		},
	},
	files = {
		winopts = { height = 0.60, preview = { hidden = "hidden" } },
	},
})
require("fzf-lua").register_ui_select()

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
}, { load = true })

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"html",
		"lua",
		"markdown",
		"vim",
		"vimdoc",
		"go",
		"gosum",
		"gomod",
		"gowork",
		"javascript",
		"typescript",
		"json",
		"tsx",
		"yaml",
		"svelte",
		"gitcommit",
		"diff",
		"git_rebase",
	},

	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ap"] = "@parameter.outer",
				["ip"] = "@parameter.inner",
			},
		},
	},
})

vim.pack.add({
	{ src = "https://github.com/j-hui/fidget.nvim" },
})

require("fidget").setup()

vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
}, { load = true })

-- Auto formatting
require("conform").setup({
	notify_on_error = false,
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		svelte = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
	},
})

-- Linting
vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-lint" },
}, { load = true })

require("lint").linters_by_ft = {
	go = { "golangcilint" },
	svelte = { "eslint" },
}

vim.pack.add({
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
}, { load = true })
require("nvim-ts-autotag").setup({})

vim.pack.add({
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
}, { load = true })
require("nvim-tree").setup({})
