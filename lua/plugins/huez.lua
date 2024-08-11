return {
  "vague2k/huez.nvim",
  import = "huez-manager.import",
  branch = "stable",
  event = "UIEnter",
  keys = {
    { "<leader>sc", ":Huez<cr>", desc = "theme selector" },
  },
  config = function()
    require("huez").setup({})
  end,
}
