return{
    {
      "kdheepak/lazygit.nvim",
      enabled = false;
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
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
    keys = {
      {"<leader>gg", "<cmd>Neogit<cr>", desc = "neogit open"}
    }
  },
}
