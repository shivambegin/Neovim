return {
  {
    "SmiteshP/nvim-navic",
    enabled = true,
    event = "BufReadPre",
    dependencies = { "folke/tokyonight.nvim", "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
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
}
