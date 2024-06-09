return {
  {
    "mcchrish/zenbones.nvim",
    enabled = false,
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme zenwritten]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
