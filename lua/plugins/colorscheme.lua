return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme rose-pine")
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyodark]])
    end,
  },
}
