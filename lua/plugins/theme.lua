return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = false,
    config = function()
      vim.cmd("colorscheme onedark")
    end,
  },
  {
    "neanias/everforest-nvim",
    name = "everforest",
    lazy = true,
    priority = 1000,
    config = function()
      require("everforest").setup({
        italics = true,
        transparent_background_level = 1,

        -- Add underline to selected word
        on_highlights = function(hl, palette)
          hl.CurrentWord = { underline = true }
        end,
      })
      -- vim.o.background = "light"
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "shaunsingh/nord.nvim",
    name = "nord",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nord")
    end,
  },
}
