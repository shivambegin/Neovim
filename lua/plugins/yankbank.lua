return {
  "ptdewey/yankbank-nvim",
  vim.keymap.set("n", "<leader>y", "<cmd>YankBank<CR>", { noremap = true }),
  config = function()
    require("yankbank").setup({
      max_entries = 12,
      sep = "",
      keymaps = {
        navigation_next = "j",
        navigation_prev = "k",
      },
      num_behavior = "prefix",
    })
  end,
}
