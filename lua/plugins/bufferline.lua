return {
  "akinsho/bufferline.nvim",
  enabled = true,
  event = "VimEnter",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  opts = {
    options = {
      mode = "buffers",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
}
