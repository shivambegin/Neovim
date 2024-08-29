return {
  "0xstepit/flow.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("flow").setup({})
    vim.cmd("colorscheme flow")
  end,
}
