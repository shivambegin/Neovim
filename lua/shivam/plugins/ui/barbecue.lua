return {
  {
    "utilyre/barbecue.nvim",
    enabled = false,
    event = "BufReadPre",
    dependencies = {
      "SmiteshP/nvim-navic",
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("barbecue").setup({
        attach_navic = true,
        show_navic = true,
        show_modified = true,
        theme = "vitesse",
        -- theme = {
        --   bg = "none", fg = "none"
        -- }
        symbols = {
          prefix = " ",
          separator = "",
          modified = "*",
          default_context = "…",
        },
      })
    end,
  },
}
