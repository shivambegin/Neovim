return {
  "Bekaboo/dropbar.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },

  lazy = false,
  enabled = false,
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
}
