return {
  "tanvirtin/monokai.nvim",
  lazy = false,
  enabled = false,
  priority = 1000,
  config = function()
    require("monokai").setup()
  end,
}
