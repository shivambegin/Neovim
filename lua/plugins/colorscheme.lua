return {
  {
    "decaycs/decay.nvim",
    name = "decay",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("decayce")
    end,
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      -- vim.cmd([[colorscheme tokyodark]])
    end,
  },
  {
    "ramojus/mellifluous.nvim",
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
      require("mellifluous").setup({
        color_set = "alduin",
        mellifluous = {
          neutral = true, -- set this to false and bg_contrast to "medium" for original mellifluous (then it was called meliora theme)
          bg_contrast = "hard", -- options: "soft", "medium", "hard"
        },
      })
      -- vim.cmd("colorscheme mellifluous")
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    opts = {},
    config = function()
      require("solarized-osaka").setup({
        transparent = false, -- Enable this to disable setting the background color
      })
      -- vim.cmd([[colorscheme solarized-osaka]])
    end,
  },
  {
    "sainnhe/gruvbox-material",
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard" -- soft, medium, hard
      vim.g.gruvbox_material_ui_contrast = "high" -- The contrast of line numbers, indent lines, etc.
      vim.g.gruvbox_material_float_style = "bright" -- Background of floating windows
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_cursor = "auto"

      -- vim.g.gruvbox_material_colors_override = { bg0 = '#000000' } -- #0e1010
      -- vim.g.gruvbox_material_colors_override = { bg0 = "#121212" }
      -- vim.g.gruvbox_material_better_performance = 1

      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd("colorscheme github_dark_default")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = false, -- disables setting the background color.
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#11111B",
          mantle = "#11111B",
        },
        macchiato = {
          rosewater = "#F5B8AB",
          flamingo = "#F29D9D",
          pink = "#AD6FF7",
          mauve = "#FF8F40",
          red = "#E66767",
          maroon = "#EB788B",
          peach = "#FAB770",
          yellow = "#FACA64",
          green = "#70CF67",
          teal = "#4CD4BD",
          sky = "#61BDFF",
          sapphire = "#4BA8FA",
          blue = "#00BFFF",
          lavender = "#00BBCC",
          text = "#C1C9E6",
          subtext1 = "#A3AAC2",
          subtext0 = "#8E94AB",
          overlay2 = "#7D8296",
          overlay1 = "#676B80",
          overlay0 = "#464957",
          surface2 = "#3A3D4A",
          surface1 = "#2F313D",
          surface0 = "#1D1E29",
          base = "#11111b",
          mantle = "#11111b",
          crust = "#191926",
        },
      },
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.surface0 },
          WinSeparator = {
            fg = colors.lavender,
          },
        }
      end,
    },
    init = function()
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    event = "VeryLazy",
    opts = {},
    config = function()
      -- vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
}
