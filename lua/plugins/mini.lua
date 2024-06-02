return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.surround").setup({})
    -- require("mini.pairs").setup({})  --alternative for nvim-autopairs
    require("mini.move").setup({})
    -- require("mini.cursorword").setup() -- alternative for cursorline
    require("mini.bracketed").setup({

      file = { suffix = "" },
      window = { suffix = "" },
      quickfix = { suffix = "" },
      yank = { suffix = "" },
      treesitter = { suffix = "n" },
    })
  end,
}
