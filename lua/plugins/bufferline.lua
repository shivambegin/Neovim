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
      always_show_bufferline = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "FileTree",
          highlight = "Directory",
          text_align = "center",
          separator = false,
        },
      },
    },
  },
}
