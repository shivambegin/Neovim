return {
  "davidosomething/vim-colors-meh",
  enabled = false,
  lazy = false,
  event = "VeryLazy",
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd("colorscheme meh")
  end,
}
