return {
  {
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
  },
  {
    "echasnovski/mini.indentscope",
    version = false,
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    opts = {
      symbol = "┆",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "alpha",
          "dashboard",
          "help",
          "lazy",
          "lazyterm",
          "mason",
          "neo-tree",
          "notify",
          "toggleterm",
          "trouble",
          "Trouble",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
