return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-surround").setup()
  end,
}
