return {
  "sainnhe/sonokai",
  enabled = false,
  lazy = false,
  name = "sonokai",
  opts = {},
  config = function()
    vim.cmd("colorscheme sonokai")
    vim.g.sonokai_style = "andromeda"
    vim.g.sonokai_better_performance = 1
  end,
}
