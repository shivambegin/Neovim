return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      -- vim.cmd("colorscheme onedark_dark")
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      -- vim.cmd([[ colorscheme neofusion ]])
    end,
  },
}
