return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      float = {
        max_height = 20,
        max_width = 60,
      },
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
