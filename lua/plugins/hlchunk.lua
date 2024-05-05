return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    blank = {
      enable = false,
    },
    chunk = {
      notify = false,
      chars = {
        right_arrow = "─",
      },
    },
    line_num = {
      enable = false,
    },
  },
}
