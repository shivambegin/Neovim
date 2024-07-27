return {
  "Bekaboo/dropbar.nvim",
  lazy = false,
  enabled = true,
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
}
