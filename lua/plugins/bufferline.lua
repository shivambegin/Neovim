-- buffer line
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  opts = {
    options = {
      mode = "buffers",
      -- separator_style = "slant",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
}
