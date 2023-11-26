return {
  "akinsho/bufferline.nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagonostics = true,
        show_close_icon = false,
        show_buffer_close_icon = false,
      },
    })
  end,
}
