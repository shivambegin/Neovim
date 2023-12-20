return {
  "nvimdev/lspsaga.nvim",
  enabled = true,
  config = function()
    require("lspsaga").setup({
      symbol_in_winbar = {
        enable = false,
        hide_keyword = false,
        show_file = true,
        folder_level = 2,
        color_mode = true,
        delay = 300,
      },
      code_action = {
        num_shortcut = true,
        show_server_name = false,
        extend_gitsigns = false,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
