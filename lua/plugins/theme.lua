return {
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme poimandres")
      -- require("poimandres").setup({})
    end,
  },
  {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("oldworld")
    end,
  },
}
