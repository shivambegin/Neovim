return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  enabled = true,
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      debug = { logging = true },
      mode = "buffers",
      indicator = { icon = "▍", style = "underline" },
      sort_by = "insert_after_current",
      move_wraps_at_ends = true,
      right_mouse_command = "vert sbuffer %d",
      show_close_icon = false,
      show_buffer_close_icons = false,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        level = level:match("warn") and "warn" or level
        return (icons[level] or "?") .. " " .. count
      end,
      diagnostics_update_in_insert = false,
      hover = { enabled = true, reveal = { "close" } },
      offsets = {
        {
          filetype = "neo-tree",
          text = " File Explorer",
          highlight = "Directory",
          separator = false,
        },
      },
    },
  },
}
