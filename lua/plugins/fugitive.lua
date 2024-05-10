return {
  {
    "tpope/vim-fugitive",
    enabled = false,
    cmd = "Git",
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Status" },
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
      { "<leader>go", "<cmd>Git browse<cr>", desc = "Browse" },
    },
  },
}
