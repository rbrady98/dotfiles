local cmp_ok, cmp = pcall(require, "cmp")
if not cmp_ok then
  return
end

local snip_ok, luasnip = pcall(require, "luasnip")
if not snip_ok then
  return
end


local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Icons that show up in completion menu
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

-- cmp setup
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
 mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<TAB>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-TAB>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  }),
  formatting = {

    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      return vim_item
    end
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = false,
    native_menu = false,
  },
}

-- Custom complete list highlights

local palette = require("nightfox.palette").load("nordfox")


-- vim.cmd(string.format('highlight! CmpItemAbbrMatch guibg=NONE guifg=%s', palette.blue.base))
-- vim.cmd[[highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch]]
--
-- vim.cmd(string.format('highlight! CmpItemKindVariable  guibg=NONE guifg=%s', palette.cyan.bright))
-- vim.cmd[[highlight! link CmpItemKindInterface CmpItemKindVariable]]
-- vim.cmd[[highlight! link CmpItemKindText CmpItemKindVariable]]
--
-- vim.cmd(string.format('highlight! CmpItemKindFunction guibg=NONE guifg=%s', palette.magenta.bright))
-- vim.cmd[[highlight! link CmpItemKindMethod CmpItemKindFunction]]
--
-- vim.cmd(string.format('highlight! CmpItemKindKeyword guibg=NONE guifg=%s', palette.red.bright))
-- vim.cmd[[highlight! link CmpItemKindProperty CmpItemKindKeyword]]
-- vim.cmd[[highlight! link CmpItemKindUnit CmpItemKindKeyword]]
