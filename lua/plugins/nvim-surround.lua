return {
  "kylechui/nvim-surround",
  version = "*",
  enabled = false, -- trying mini surround
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-surround").setup()
  end,
}
