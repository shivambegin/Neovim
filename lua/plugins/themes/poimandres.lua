return {
  "olivercederborg/poimandres.nvim",
  lazy = false,
  priority = 1000,
  enabled = false,
  config = function()
    require("poimandres").setup({})
  end,

  init = function()
    vim.cmd("colorscheme poimandres")
  end,
}
