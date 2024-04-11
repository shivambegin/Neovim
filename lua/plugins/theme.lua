return {
  {
    "ramojus/mellifluous.nvim",
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
      require("mellifluous").setup({}) -- optional, see configuration section.
      -- vim.cmd("colorscheme mellifluous")
    end,
  },
  {
    "m4xshen/catppuccinight.nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.surface0 },
        }
      end,
    },
    init = function()
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
