return{
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
    "utilyre/barbecue.nvim",
    enabled = false,
    event = "BufReadPre",
    dependencies = {
      "folke/tokyonight.nvim",
      "SmiteshP/nvim-navic",
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup({
        attach_navic = false,
        show_navic = false,
        show_modified = true,
        theme = "tokyonight",
        symbols = {
          prefix = " ",
          separator = "",
          modified = "*",
          default_context = "…",
        },
      })
    end,
  },
  {
    'Bekaboo/dropbar.nvim',
    enabled = false,
    -- optional, but required for fuzzy finder support
    -- sadly requires 0.10 nightly neovim version for now
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    }
  }
}
