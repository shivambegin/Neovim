return{
    {
      "kdheepak/lazygit.nvim",
      cmd = { "LazyGit", "LazyGitConfig" },
      keys = {
          { "<leader>gg", ":LazyGit<cr>", silent = true, desc = "LazyGit", mode = "n" },
      },
      config = function()
          vim.g.lazygit_floating_window_border_chars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' } -- no borders
      end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { "<leader>gb", "<cmd>Git blame<cr>", desc = "Blame" },
      { "<leader>go", "<cmd>Git browse<cr>", desc = "Browse" },
    },
  }
}
