return {
    "utilyre/barbecue.nvim",
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
  }
