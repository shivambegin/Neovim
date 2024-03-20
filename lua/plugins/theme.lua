return {
  {

    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          mocha = {
            rosewater = "#ffc0b9",
            flamingo = "#f5aba3",
            pink = "#f592d6",
            mauve = "#c0afff",
            red = "#ea746c",
            maroon = "#ff8595",
            peach = "#fa9a6d",
            yellow = "#ffe081",
            green = "#99d783",
            teal = "#47deb4",
            sky = "#00d5ed",
            sapphire = "#00dfce",
            blue = "#00baee",
            lavender = "#abbff3",
            text = "#cccccc",
            subtext1 = "#bbbbbb",
            subtext0 = "#aaaaaa",
            overlay2 = "#999999",
            overlay1 = "#888888",
            overlay0 = "#777777",
            surface2 = "#666666",
            surface1 = "#555555",
            surface0 = "#444444",
            base = "#202020",
            mantle = "#222222",
            crust = "#333333",
          },
        },
      })
      vim.cmd("colorscheme catppuccin-mocha")
    end,
  },
  {
    "sam4llis/nvim-tundra",
    lazy = false,
    priority = 1000,
    config = function()
      require("nvim-tundra").setup({
        transparent_background = false,
        dim_inactive_windows = {
          enabled = false,
          color = nil,
        },
        sidebars = {
          enabled = true,
          color = nil,
        },
        editor = {
          search = {},
          substitute = {},
        },
        syntax = {
          booleans = { bold = true, italic = true },
          comments = { bold = true, italic = true },
          conditionals = {},
          constants = { bold = true },
          fields = {},
          functions = {},
          keywords = {},
          loops = {},
          numbers = { bold = true },
          operators = { bold = true },
          punctuation = {},
          strings = {},
          types = { italic = true },
        },
        diagnostics = {
          errors = {},
          warnings = {},
          information = {},
          hints = {},
        },
        plugins = {
          lsp = true,
          semantic_tokens = true,
          treesitter = true,
          telescope = true,
          nvimtree = true,
          cmp = true,
          context = true,
          dbui = true,
          gitsigns = true,
          neogit = true,
          textfsm = true,
        },
        overwrite = {
          colors = {},
          highlights = {},
        },
      })

      vim.g.tundra_biome = "arctic" -- 'arctic' or 'jungle'
      vim.opt.background = "dark"
      -- vim.cmd("colorscheme tundra")
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({})
    end,
    init = function()
      -- vim.cmd("colorscheme poimandres")
    end,
  },
  {
    "jesseleite/nvim-noirbuddy",
    dependencies = {
      { "tjdevries/colorbuddy.nvim", branch = "dev" },
    },
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd("colorscheme noirbuddy")
    end,
  },
}
