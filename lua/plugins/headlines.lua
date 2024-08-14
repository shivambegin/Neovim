return {
  "lukas-reineke/headlines.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  enabled = false,
  config = function()
    require("headlines").setup({})
  end,
}
