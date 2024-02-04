return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.statusline").setup({})
    require("mini.surround").setup({})
    require("mini.indentscope").setup({
      symbol = "│",
    })
    require("mini.pairs").setup({})
  end,
}
