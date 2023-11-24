return {
  "akinsho/bufferline.nvim",
  enabled = false,
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  },
  opts = {
    options = {
      mode = "tabs",
      --separator_style = "slant",
      show_buffer_close_icons = false,
      show_close_icon = false,
    },
  },
}
