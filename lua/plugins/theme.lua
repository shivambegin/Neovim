return {
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({})
    end,
    init = function()
      -- vim.cmd("colorscheme poimandres")
    end,
  },
  {
    "jesseleite/nvim-noirbuddy",
    dependencies = {
      { "tjdevries/colorbuddy.nvim", branch = "dev" },
    },
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme noirbuddy")
    end,
  },
}
