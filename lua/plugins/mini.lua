return {
  {
    "echasnovski/mini.nvim",
    event = { "BufReadPost", "BufAdd", "BufNewFile" },
    version = false,
    config = function()
      require("mini.surround").setup({})
      require("mini.pairs").setup({}) --alternative for nvim-autopairs
      require("mini.move").setup({})
      require("mini.cursorword").setup() -- alternative for cursorline
      require("mini.tabline").setup()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true })
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end

      require("mini.bracketed").setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },
}
