return {
  "stevearc/oil.nvim",
  event = "VeryLazy",
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" }),
    })
  end,
}
