return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      char = "│",
      tab_char = " ",
    },
    scope = {
      enabled = true,
      char = " ",
      show_start = false,
    },
  },
  config = function()
    require("ibl").setup()
  end,
}
