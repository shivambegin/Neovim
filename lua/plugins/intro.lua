return {
  "OXY2DEV/intro.nvim",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("intro").setup({ preset = "cat_blue" })
  end,
}
