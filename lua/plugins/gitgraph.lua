return {
  "isakbm/gitgraph.nvim",
  enabled = false,
  dependencies = { "sindrets/diffview.nvim" },
  opts = {
    symbols = {
      merge_commit = "M",
      commit = "*",
    },
    format = {
      timestamp = "%H:%M:%S %d-%m-%Y",
      fields = { "hash", "timestamp", "author", "branch_name", "tag" },
    },
  },
  init = function()
    vim.keymap.set("n", "<leader>gl", function()
      require("gitgraph").draw({}, { all = true, max_count = 5000 })
    end, { desc = "new git graph" })
  end,
}
