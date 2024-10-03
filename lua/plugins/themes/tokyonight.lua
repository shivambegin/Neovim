return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    })
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
