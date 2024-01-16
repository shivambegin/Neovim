return {
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = true,
    lazy = false,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfly]])
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
      })
      vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
  },
}
