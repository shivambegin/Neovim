return {
  "ramojus/mellifluous.nvim",
  enabled = false,
  config = function()
    require("mellifluous").setup({
      colorset = "alduin",
    }) -- optional, see configuration section.
    vim.cmd("colorscheme mellifluous")
  end,
}
