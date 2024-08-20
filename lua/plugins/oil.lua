return {
  "stevearc/oil.nvim",
  opts = {
    float = {
      max_height = 20,
      max_width = 60,
    },
  },
  keys = {
    { "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
