return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.surround").setup({})
    require("mini.pairs").setup({})
    require("mini.move").setup({})
    require("mini.bracketed").setup({

      file = { suffix = "" },
      window = { suffix = "" },
      quickfix = { suffix = "" },
      yank = { suffix = "" },
      treesitter = { suffix = "n" },
    })
  end,
}
