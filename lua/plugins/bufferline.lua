return {
  "akinsho/bufferline.nvim",
  enabled = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      separator_style = "thin",
      always_show_bufferline = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "",
          highlight = "Directory",
          text_align = "left",
          separator = false,
        },
      },
    },
  },
}
