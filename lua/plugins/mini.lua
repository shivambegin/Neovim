return {
  {
    "echasnovski/mini.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    version = false,
    config = function()
      require("mini.surround").setup({})
      require("mini.pairs").setup({}) --alternative for nvim-autopairs
      require("mini.move").setup({})
      require("mini.move").setup({})
      require("mini.tabline").setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },
}
