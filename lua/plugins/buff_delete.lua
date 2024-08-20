return {
  "famiu/bufdelete.nvim",
  keys = {
    {
      "<leader>q",
      ":lua require('bufdelete').bufdelete(0, false)<cr>",
      silent = true,
      desc = "Quit Buffer",
    },
  },
}
