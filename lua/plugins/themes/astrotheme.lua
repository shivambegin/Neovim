return {
  "AstroNvim/astrotheme",
  event = "VeryLazy",
  config = function()
    require("astrotheme").setup({})
    vim.cmd("colorscheme astrotheme")
  end,
}
