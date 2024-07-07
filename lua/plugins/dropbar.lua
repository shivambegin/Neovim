return {
  "Bekaboo/dropbar.nvim",
  enabled = true,
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
}
