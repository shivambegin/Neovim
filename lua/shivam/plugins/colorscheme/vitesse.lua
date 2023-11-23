return {
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    priority = 1000,
    lazy = false,
    enabled = true,
    config = function()
      vim.cmd([[colorscheme vitesse]])
    end,
  },
}
