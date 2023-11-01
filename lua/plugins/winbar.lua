return{
{
    "utilyre/barbecue.nvim",
    enabled =false,
    event = "BufReadPre",
    dependencies = {
      "folke/tokyonight.nvim",
      "SmiteshP/nvim-navic",
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons"
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
          modified = "●",
          default_context = "…",
        },
      })
    end,
  },
  {
    "SmiteshP/nvim-navic",
    enabled = true,
    event = "BufReadPre",
    dependencies = { "folke/tokyonight.nvim","MunifTanjim/nui.nvim","nvim-tree/nvim-web-devicons" },
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
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    enabled = false,
    event = 'BufReadPre',
    opts = {
      ui = {border = 'rounded'},
      symbol_in_winbar = {
        enable = true,
        folder_level = 2,
      },
      lightbulb = {
        enable = false,
        sign = false,
      },
      outline = {
        layout = 'float',
        max_height = 0.7,
        left_width = 0.4,
      },
    },
  },
  {
    "LunarVim/breadcrumbs.nvim",
    enabled = true,
    dependencies = {
      {"SmiteshP/nvim-navic"},
      {"nvim-tree/nvim-web-devicons"}
    },
    config = function()
      require("nvim-navic").setup {
        lsp = {
            auto_attach = true,
        },
    }
    require("breadcrumbs").setup()
    end
  },
}

