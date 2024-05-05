return {
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
    event = "VimEnter",
    config = function()
      require("dashboard").setup({
        theme = "hyper",
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
