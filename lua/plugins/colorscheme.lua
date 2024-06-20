return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme carbonfox")
    end,
  },
  {
    "ayu-theme/ayu-vim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme ayu")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        palette_overrides = {
          gray = "#61afef", -- comments are blue and by that I mean BLUE
        },
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "tomasr/molokai",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme molokai")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
          hide_nc_statusline = false,
          hide_end_of_buffer = false,
          inverse = {
            match_paren = true,
            -- visual = true,
            search = true,
          },
          darken = {
            sidebars = {
              enabled = false,
            },
          },
        },
        groups = {
          all = {
            ["@label.jsonc"] = { link = "@label.json" },
          },
        },
      })

      vim.g.github_theme_debug = true

      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
  {
    "jesseleite/nvim-noirbuddy",
    dependencies = {
      { "tjdevries/colorbuddy.nvim" },
    },
    lazy = true,
    priority = 1000,
    opts = {
      preset = "minimal",
    },
  },
}
