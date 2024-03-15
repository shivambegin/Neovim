return {
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
      vim.cmd("colorscheme tundra")
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
