return {
  {
    "bluz71/vim-nightfly-guicolors",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = true,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme nightfly]])
    end,
  },
}
