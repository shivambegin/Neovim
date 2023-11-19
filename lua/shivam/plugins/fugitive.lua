return {
    {
        "tpope/vim-fugitive",
        enabled = true,
        cmd = "Git",
        keys = {
          { "<leader>gs", "<cmd>Git<cr>", desc = "Status" },
          { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
          { "<leader>go", "<cmd>Git browse<cr>", desc = "Browse" },
        },
      }
}
