-- WARN: This plugin is in it's alpha phase. Breaking changes may occur.
return {
  "OXY2DEV/helpview.nvim",
  lazy = false, -- Recommended

  -- In case you still want to lazy load
  -- ft = "help",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}
