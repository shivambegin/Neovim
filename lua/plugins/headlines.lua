return {
  "lukas-reineke/headlines.nvim",
  dependencies = "nvim-treesitter/nvim-treesitter",
  enbaled = false,
  config = function()
    require("headlines").setup({})
  end,
}
