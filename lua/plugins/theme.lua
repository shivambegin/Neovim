return {
  {
    "luisiacc/gruvbox-baby",
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox-baby")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "moon" },
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
