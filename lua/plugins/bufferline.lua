return {
  "akinsho/bufferline.nvim",
  enabled = false,
  event = "VeryLazy",
  keys = {},
  opts = {
    options = {
      indicator = {
        icon = "▊",
        style = "icon",
      },
      truncate_names = false,
      modified_icon = "●",
      color_icons = true,
      show_buffer_icons = true,
      show_buffer_close_icons = false,
      separator_style = thin,
      left_trunc_marker = "<U+F0A8>",
      right_trunc_marker = "<U+F0A9>",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
      always_show_bufferline = false,
    },
    highlights = {
      buffer_selected = {
        bold = true,
        italic = true,
        sp = "#ef8f8f",
      },
      tab_selected = {
        sp = "#af6faf",
      },
    },
  },
}
