return{
{
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
  },
  {
    "SmiteshP/nvim-navic",
    enabled = true,
    event = "BufReadPre",
    dependencies = { "folke/tokyonight.nvim","MunifTanjim/nui.nvim","nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " › ", highlight = true, depth_limit = 3 })

      local theme = require("plugins.theme")
      local colors = theme.colors()
      if not colors then
        return
      end
    end,
  }
}
