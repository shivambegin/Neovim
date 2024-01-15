return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    enabled = false,
    config = function()
      require("dashboard").setup({
        -- config
      })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
