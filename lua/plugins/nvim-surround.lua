return {
  "kylechui/nvim-surround",
  version = "*",
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-surround").setup()
  end,
}
