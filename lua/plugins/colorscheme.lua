return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  event = "VeryLazy",
  opts = { style = "night" },
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
}
