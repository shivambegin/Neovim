return {
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
    enabled = false,
    event = { "LspAttach" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      ui = {
        title = false,
      },
      outline = {
        keys = {
          expand_or_jump = "<cr>",
        },
      },
      finder = {
        keys = {
          vsplit = "v",
          split = "s",
          quit = { "q", "<esc>" },
          edit = { "<cr>" },
          close_in_preview = "q",
        },
      },
      definition = {
        edit = "<cr>",
        vsplit = "<C-v>",
        split = "<C-s>",
        tabe = "<C-t>",
      },
      lightbulb = {
        enable = false,
        enable_in_insert = false,
      },
      -- breadcrumbs
      -- https://github.com/glepnir/lspsaga.nvim#lspsaga-symbols-in-winbar
      symbol_in_winbar = {
        enable = false,
        separator = " > ",
        show_file = true,
        folder_level = 1,
        color_mode = true,
      },
      beacon = {
        enable = false,
      },
      implement = {
        enable = false,
      },
      -- diagnostic = {
      --   extend_relatedInformation = true,
      -- },
    },
  },

  {
    "LunarVim/breadcrumbs.nvim",
    enabled = true,
    dependencies = {
      { "SmiteshP/nvim-navic" },
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      require("nvim-navic").setup({
        lsp = {
          auto_attach = true,
        },
      })
      require("breadcrumbs").setup()
    end,
  },
  {
    "Bekaboo/dropbar.nvim",
    enabled = false,
    -- optional, but required for fuzzy finder support
    -- sadly requires 0.10 nightly neovim version for now
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
  {
    "SmiteshP/nvim-navic",
    enabled = true,
    event = "BufReadPre",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " › ", highlight = true, depth_limit = 3 })

      -- local theme = require("plugins.theme")
      -- local colors = theme.colors()
      -- if not colors then
      --   return
      -- end
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufReadPre", "BufNewFile"},
    enabled = false,
    config = function()
      require("ibl").setup({
        scope = { enabled = false },
      })
    end,
  },
    -- Create annotations with one keybind, and jump your cursor in the inserted annotation
    {
      "danymat/neogen",
      keys = {
        {
          "<leader>cc",
          function()
            require("neogen").generate({})
          end,
          desc = "Neogen Comment",
        },
      },
      opts = { snippet_engine = "luasnip" },
    },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },

}
