return {
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    priority = 1000,
    lazy = true,
    enabled = false,
    config = function()
      vim.cmd([[colorscheme vitesse]])
    end,
  },
}
