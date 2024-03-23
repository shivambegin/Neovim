return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    window = {
      border = border or "rounded",
    },
    layout = {
      align = "center",
      height = {
        min = 1,
      },
    },
  },
}
