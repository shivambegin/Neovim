return -- LazyGit integration with Telescope
{
  "kdheepak/lazygit.nvim",
  keys = {
    {
      ";c",
      ":LazyGit<Return>",
      silent = true,
      noremap = true,
    },
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
