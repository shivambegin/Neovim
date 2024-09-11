return {
  "ayu-theme/ayu-vim",
  lazy = false,
  priority = 1000,
  enabled = false,
  config = function()
    vim.cmd("colorscheme ayu")
  end,
}
