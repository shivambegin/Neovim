return {
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme nightfly]])
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = true,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        {
          bold_vert_split = false, -- use bold vertical separators
          dim_nc_background = false, -- dim 'non-current' windows
          disable_background = true, -- disable background
          disable_float_background = true, -- disable background for floats
          disable_italics = false, -- disable italics
        },
      })
      vim.cmd("colorscheme poimandres")
    end,
  },
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
    "navarasu/onedark.nvim",
    priority = 1000, -- Ensure it loads first
    lazy = true,
    config = function()
      require("onedark").setup({
        style = "darker",
      })
      require("onedark").load()
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
