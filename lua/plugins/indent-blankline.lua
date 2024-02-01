return {
  "lukas-reineke/indent-blankline.nvim",
  lazy = true,
  main = "ibl",
  opts = {},
  config = function()
    require("ibl").setup()
  end,
}
