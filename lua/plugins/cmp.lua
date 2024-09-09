-- configure autocomplete
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    -- autocomplete plugins
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    -- "hrsh7th/cmp-nvim-lsp-signature-help",
    -- "hrsh7th/cmp-calc",

    -- vscode like icons to autocomplete list
    "onsails/lspkind.nvim",
    -- snippet plugin
    "L3MON4D3/LuaSnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip/loaders/from_vscode").lazy_load()
    local lspkind = require("lspkind")

    cmp.setup({
      auto_brackets = {}, -- configure any filetype to auto add brackets
      performance = {
        debounce = 0, -- default is 60ms
        throttle = 0, -- default is 30ms
      },
      completion = {
        keyword_length = 1,
        completeopt = "menu,menuone,noselect",
      },
      formatting = {
        expandable_indicator = true,
        fields = {
          "abbr",
          "kind",
          "menu",
        },
        format = lspkind.cmp_format({
          mode = "symbol",
          maxwidth = 65,
          -- ellipsis_char = "...",
          show_labelDetails = false,
          before = function(entry, item)
            item.menu = ""
            return item
          end,
        }),
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<Esc>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        }),
      },
      -- `/` cmdline setup.
      cmp.setup.cmdline({ "/", "?" }, {
        completion = { completeopt = "menu,menuone,noselect" },
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      }),
      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        completion = { completeopt = "menu,menuone,noselect" },
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          { { name = "path" } },
          { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
        ),
      }),
      -- sources for autocompletion
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
        { name = "supermaven" },
        -- { name = "nvim_lsp_signature_help" },
        -- { name = "calc" }, --for maths calculations
      },
    })
  end,
}
