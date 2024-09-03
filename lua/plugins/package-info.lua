return {
  {
    "vuki656/package-info.nvim",
    ft = "json",
    dependencies = { "MunifTanjim/nui.nvim" },
    keys = {
      {
        "<leader>spi",
        "<cmd>Telescope package_info<cr>",
        desc = "Show package info",
      },
    },
    opts = {
      {
        package_manager = "npm",
        hide_up_to_date = true,
      },
    },
  },
}
