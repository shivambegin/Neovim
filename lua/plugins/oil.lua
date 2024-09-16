return {
  "stevearc/oil.nvim",
  opts = {
    columns = {
      "icon",
    },
    win_options = {
      signcolumn = "auto",
    },
    lsp_file_methods = {
      autosave_changes = true,
    },
    view_options = {
      show_hidden = false,
      natural_order = true,
    },
    float = {
      max_height = 20,
      max_width = 60,
    },
  },
  keys = {
    { "<leader>-", "<CMD>Oil<CR>", desc = "Open parent directory" },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
