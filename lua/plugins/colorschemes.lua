return {

  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("ayu").setup({
        -- vim.cmd([[colorscheme ayu]]),
      })
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("solarized-osaka").setup({
        -- vim.cmd([[colorscheme solarized-osaka]]),
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("everforest").setup({
        -- vim.cmd([[colorscheme everforest]]),
      })
    end,
  },
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    opts = {
      reverse_visual = true,
      dim_nc = true,
      cmp_cmdline_disable_search_highlight_group = true,
      diagnostic_virtual_text_background = true,
      transparent_background = true,
      transparent_float_background = true, -- aka pum(popup menu) background
    },
    config = function()
      -- vim.cmd([[colorscheme vitesse]])
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({

        vim.cmd("colorscheme rose-pine"),
        -- vim.cmd('colorscheme rose-pine-main')
        -- vim.cmd('colorscheme rose-pine-moon')
        -- vim.cmd("colorscheme rose-pine-dawn"),
      })
    end,
  },
  {
    "Tsuzat/NeoSolarized.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd([[ colorscheme NeoSolarized ]])
    end,
  },
}
