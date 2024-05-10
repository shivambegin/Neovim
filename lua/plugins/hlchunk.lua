return {
  "shellRaining/hlchunk.nvim",
  event = "BufReadPre",
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
