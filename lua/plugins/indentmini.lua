return {
  "nvimdev/indentmini.nvim",
  lazy = false,
  enabled = false,
  config = function()
    require("indentmini").setup()
  end,
}
