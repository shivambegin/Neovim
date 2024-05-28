return {
  "shellRaining/hlchunk.nvim",
  enabled = false,
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
