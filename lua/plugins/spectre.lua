return {
  "nvim-pack/nvim-spectre",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = {
    { "<leader>sr", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
  },
  config = function()
    require("spectre").setup()
  end,
}
