return {
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      vim.cmd([[ colorscheme NeoSolarized ]])
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd("colorscheme solarized-osaka")
    end,
  },
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
    lazy = true,
    config = function()
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
